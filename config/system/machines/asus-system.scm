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
;; TODO before deploying: replace <ETH-ASUS> with the real wired interface
;; name (`ip link`).
(operating-system
 (inherit base-system)
 (host-name "asus")
 (services
  (cons* (service static-networking-service-type
                  (list (static-networking
                         (addresses (list (network-address
                                           (device "<ETH-ASUS>")
                                           (value "10.0.0.4/24")))))))
         (operating-system-user-services base-system))))
