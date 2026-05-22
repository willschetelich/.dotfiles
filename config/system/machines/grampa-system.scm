(define-module (config system machines grampa-system)
  #:use-module (gnu)
  #:use-module (config system base-system))

;; grampa = base system + hostname. It has a single wired NIC that is USUALLY a
;; local-only LAN (static 10.0.0.3) but is SOMETIMES plugged into an internet
;; uplink. That dual use is why NetworkManager is KEPT (inherited from base's
;; %desktop-services) rather than removed: NM can DHCP on the internet uplink
;; while still carrying the static LAN address on the same connection.
;;
;; static-networking is NOT used here -- a fixed-only stack can't also DHCP.
;; Instead configure one persistent NM wired connection once (it lives in
;; /etc/NetworkManager/system-connections), e.g.:
;;
;;   nmcli con add type ethernet ifname <ETH-GRAMPA> con-name wired \
;;     ipv4.method auto ipv4.addresses 10.0.0.3/24 ipv4.may-fail yes
;;
;; -> always reachable at 10.0.0.3 on the LAN; also pulls a DHCP address +
;;    gateway + DNS when on the internet, and does not fail on the DHCP-less LAN.
;;    (<ETH-GRAMPA> = the real wired interface name from `ip link`.)
(operating-system
 (inherit base-system)
 (host-name "grampa"))
