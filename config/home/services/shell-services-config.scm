(define-module (config home services shell-services-config)
  #:use-module (gnu home)
  #:use-module (gnu services)
  #:use-module (gnu home services shells)
  #:export (shell-service)
  )

(define shell-service
  (service home-bash-service-type ;; returns a service object
	   (home-bash-configuration ;; this is a record with fields like...
	    (aliases '(("guix-home-reconfigure" . "guix home -L ~/.dotfiles reconfigure ~/.dotfiles/config/home/home-config.scm" ))))))
