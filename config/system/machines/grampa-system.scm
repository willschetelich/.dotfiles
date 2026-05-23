(define-module (config system machines grampa-system)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (config system base-system))

(use-service-modules desktop)

(operating-system
 (inherit base-system)
 (host-name "grampa")
 (mapped-devices (list (mapped-device ; this tells guix about my LUKS encrypted partition, which unlocks ' file-systems'
                        (source (uuid "00000000-0000-0000-0000-000000000000")) ; TODO - sudo blkid
                        (target "cryptroot") ; the name given to the unlocked partition
                        (type luks-device-mapping))))
 
 (file-systems (cons* (file-system ; 
                       (mount-point "/boot/efi") ; GRUB lives here
                       (device (uuid "0000-0000" 'fat32))
                       (type "vfat"))
                      (file-system ; my actual system lives here, revealed after LUKS unlocks
                       (mount-point "/")
                       (device "/dev/mapper/cryptroot")
                       (type "ext4")
                       (dependencies mapped-devices))
                      %base-file-systems))
 (services
  (cons (service xfce-desktop-service-type)
        (operating-system-user-services base-system))))
