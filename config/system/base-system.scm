
(define-module (config system base-system)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (nongnu packages linux)
  #:export (base-system))

(use-service-modules cups desktop networking ssh xorg)

;; Shared operating-system. Per-machine files do
;; (operating-system (inherit base-system) ...) and override only what
;; differs (host-name, networking). Note: mapped-devices and file-systems
;; live here for now but use placeholder/identical UUIDs -- real machines
;; need their own (blkid) values, so these likely move per-machine later.
(define base-system
  (operating-system
   (kernel linux)
   (firmware (list linux-firmware))
   (locale "en_US.utf8")
   (timezone "America/New_York")
   (keyboard-layout (keyboard-layout "us"))
   (host-name "base")

   ;; The list of user accounts ('root' is implicit).
   (users (cons* (user-account
                  (name "will")
                  (comment "will")
                  (group "users")
                  (home-directory "/home/will")
                  (supplementary-groups '("wheel" "netdev" "audio" "video")))
                 %base-user-accounts))

   ;; Packages installed system-wide.  Users can also install packages
   ;; under their own account: use 'guix search KEYWORD' to search
   ;; for packages and 'guix install PACKAGE' to install a package.
   (packages (append (list (specification->package "i3-wm")
                           (specification->package "i3status")
                           (specification->package "dmenu")
                           (specification->package "st")) %base-packages))

   ;; Below is the list of system services.  To search for available
   ;; services, run 'guix system search KEYWORD' in a terminal.
   ;; %desktop-services includes NetworkManager -- kept here as the default
   ;; (thinkpad needs it for wifi); grampa strips it in its own file.
   (services
    (append (list (service xfce-desktop-service-type)
                  (set-xorg-configuration
                   (xorg-configuration (keyboard-layout keyboard-layout))))

            ;; This is the default list of services we
            ;; are appending to.
            %desktop-services))
   (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (targets (list "/boot/efi"))
                (keyboard-layout keyboard-layout)))
   (mapped-devices (list (mapped-device
                          (source (uuid
                                   "f6fc7538-edb6-4c4f-aab6-fb150d441f79"))
                          (target "cryptroot")
                          (type luks-device-mapping))))

   ;; The list of file systems that get "mounted".  The unique
   ;; file system identifiers there ("UUIDs") can be obtained
   ;; by running 'blkid' in a terminal.
   (file-systems (cons* (file-system
                         (mount-point "/boot/efi")
                         (device (uuid "519E-A5CB"
                                       'fat32))
                         (type "vfat"))
                        (file-system
                         (mount-point "/")
                         (device "/dev/mapper/cryptroot")
                         (type "ext4")
                         (dependencies mapped-devices)) %base-file-systems))))
