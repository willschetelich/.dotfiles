(define-module (config system machines grampa)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (nongnu packages linux)
  #:use-module (config system base-system))

(use-service-modules networking)

;; grampa = base system + hostname + fully static networking.
;; NetworkManager is removed (no DHCP anywhere); the wired interface is
;; pinned via static-networking.
;;
;; TODO before deploying: replace <ETH-GRAMPA> with the real wired interface
;; name (`ip link`), and <GATEWAY>/<DNS> with your gateway/resolver.
(operating-system
 (inherit base-system)
 (host-name "grampa")
 (services
  (cons* (service static-networking-service-type
                  (list (static-networking
                         (addresses (list (network-address
                                           (device "<ETH-GRAMPA>")
                                           (value "10.0.0.3/24"))))
                         (routes (list (network-route
                                        (destination "default")
                                        (gateway "<GATEWAY>"))))
                         (name-servers '("<DNS>")))))
         (modify-services (operating-system-user-services base-system)
           (delete network-manager-service-type)))))
