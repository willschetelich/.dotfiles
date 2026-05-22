(define-module (config home services emacs)
  #:use-module (gnu home services)
  #:use-module (gnu home services xdg)
  #:use-module (gnu packages emacs)
  #:use-module (guix gexp)
  #:export (emacs-home-service))

(define emacs-home-service
  (list
   ;; 1. Install Emacs to the home profile
   (home-profile-service-type-service
    (list emacs-pgtk)) ; Or use 'emacs' depending on your graphics server

   ;; 2. Symlink the init.el file to ~/.config/emacs/init.el
   (simple-service
    'emacs-dotfile-service
    home-xdg-configuration-files-service-type
    `(("emacs/init.el"
       ,(local-file "../../../files/emacs/init.el" "init.el"))))))
       