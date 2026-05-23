(define-module (config system machines thinkpad-system)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (nongnu packages linux)
  #:use-module (config system base-system))

(use-service-modules desktop networking)

;; thinkpad = base system + hostname + a static IP on the wired interface.
;; The wired net is local-only (no internet): just an address, no default
;; route and no DNS -- the /24 gives an on-link route to the 10.0.0.0/24 LAN.
;; Internet/DNS come over wifi via NetworkManager (kept from %desktop-services).
;;
;; TODO before deploying:
;;  - replace <ETH-THINKPAD> with the real wired interface name (`ip link`).
;;  - replace the placeholder UUIDs below with this machine's real values
;;    from `blkid` (the LUKS partition + the EFI partition).
(operating-system
 (inherit base-system)
 (host-name "thinkpad")
 (mapped-devices (list (mapped-device
                        (source (uuid "00000000-0000-0000-0000-000000000000"))
                        (target "cryptroot")
                        (type luks-device-mapping))))
 (file-systems (cons* (file-system
                       (mount-point "/boot/efi")
                       (device (uuid "0000-0000" 'fat32))
                       (type "vfat"))
                      (file-system
                       (mount-point "/")
                       (device "/dev/mapper/cryptroot")
                       (type "ext4")
                       (dependencies mapped-devices))
                      %base-file-systems))
 (services
  (cons* (service xfce-desktop-service-type)
         (service static-networking-service-type
                  (list (static-networking
                         (addresses (list (network-address
                                           (device "<ETH-THINKPAD>")
                                           (value "10.0.0.2/24")))))))
         (operating-system-user-services base-system))))
