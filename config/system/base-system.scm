
(define-module (config system base-system)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (nongnu packages linux)
  #:export (base-system))

(use-service-modules cups desktop networking ssh xorg)

;; Shared operating-system. Per-machine files do
;; (operating-system (inherit base-system) ...) and override only what
;; differs (host-name, networking, and disk layout). mapped-devices and
;; file-systems are deliberately NOT set here: they are disk-specific (real
;; `blkid` UUIDs differ per machine), so each machine file declares its own.

(define base-system
  (operating-system
   (kernel linux)
   (firmware (list linux-firmware))
   (locale "en_US.utf8")
   (timezone "America/New_York")
   (keyboard-layout (keyboard-layout "us"))
   (host-name "base")

   ;; The list of user accounts ('root' is implicit).
   (users (cons* (user-account ; cons* prepends user-account object to %base-user-accounts, a list
                  (name "will")
                  (comment "will") ; full name 
                  (group "users")
                  (home-directory "/home/will")
                  (supplementary-groups '("wheel" "netdev" "audio" "video")))
                 %base-user-accounts))

   ;; Packages installed system-wide.  Users can also install packages
   ;; under their own account: use 'guix search KEYWORD' to search
   ;; for packages and 'guix install PACKAGE' to install a package.
   ;; Window-manager packages (i3, dmenu, st) are NOT here: they are added
   ;; per-machine (asus uses i3wm).
   (packages %base-packages)


   ;; Desktop environments (e.g. XFCE) are NOT set here: they are chosen
   ;; per-machine. base only provides the shared X server configuration.
   (services
    (cons (set-xorg-configuration
           (xorg-configuration (keyboard-layout keyboard-layout)))
          %desktop-services))
            
   (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (targets (list "/boot/efi"))
                (keyboard-layout keyboard-layout)))

   (file-systems %base-file-systems)))
