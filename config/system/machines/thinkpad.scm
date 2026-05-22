(define-module (config system machines thinkpad)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (nongnu packages linux)
  #:use-module (config system base-system))

(use-service-modules networking)

;; thinkpad = base system + hostname + a static IP on the wired interface.
;; NetworkManager (from %desktop-services in base) is kept so wifi still gets
;; DHCP; only the ethernet device is pinned here.
;;
;; TODO before deploying: replace <ETH-THINKPAD> with the real wired interface
;; name (`ip link`), and <GATEWAY>/<DNS> with your gateway/resolver.
(operating-system
 (inherit base-system)
 (host-name "thinkpad")
 (services
  (cons* (service static-networking-service-type
                  (list (static-networking
                         (addresses (list (network-address
                                           (device "<ETH-THINKPAD>")
                                           (value "10.0.0.2/24"))))
                         (routes (list (network-route
                                        (destination "default")
                                        (gateway "<GATEWAY>"))))
                         (name-servers '("<DNS>")))))
         (operating-system-user-services base-system))))
