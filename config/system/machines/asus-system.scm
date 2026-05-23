(define-module (config system machines asus-system)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (nongnu packages linux)
  #:use-module (config system base-system))

(use-service-modules networking)

;; asus = base system + hostname + a static IP on the wired interface.
;; The wired net is local-only (no internet): just an address, no default
;; route and no DNS -- the /24 gives an on-link route to the 10.0.0.0/24 LAN.
;; Internet/DNS come over wifi via NetworkManager (kept from %desktop-services).
;;
;; Wired interface is enp3s0 (predictable name on the installed system; the
;; live USB shows it as eth0).
;;
;; TODO before `guix system reconfigure` on the machine:
;;  - replace the placeholder UUIDs below with this machine's real values
;;    from `blkid` (the LUKS partition + the EFI partition). They were filled
;;    in at install time but in the ephemeral live-USB clone, so they are NOT
;;    committed here.
(operating-system
 (inherit base-system)
 (host-name "asus")
 ;; asus is the i3wm machine: pull in the window manager and friends on top
 ;; of base's system-wide packages.
 (packages (append (list (specification->package "i3-wm")
                         (specification->package "i3status")
                         (specification->package "dmenu")
                         (specification->package "st"))
                   (operating-system-packages base-system)))
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
  (cons* (service static-networking-service-type
                  (list (static-networking
                         ;; Rename the Shepherd provision so it doesn't clash
                         ;; with NetworkManager's 'networking (from
                         ;; %desktop-services), which manages wifi.
                         (provision '(networking-wired))
                         (addresses (list (network-address
                                           (device "enp3s0")
                                           (value "10.0.0.4/24")))))))
         (operating-system-user-services base-system))))
