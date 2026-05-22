(define-module (config home home-config)
 #:use-module (gnu)
 #:use-module (gnu home) ;; gives home-environment and specifications packages
 #:use-module (gnu home services) ;; provides basic services
 #:use-module (nongnu packages chrome)
 #:use-module (nongnu packages productivity)
 #:use-module (gnu services backup)
 #:use-module (gnu packages racket)
 #:use-module (config home services emacs)

 #:use-module (config home services ssh-service-config) ;; imports custom config
 #:use-module (config home services borgmatic-service-config)
 #:use-module (config home services shell-services-config))
	  

(home-environment
 (packages (specifications->packages
	    (list "git"
		  "obsidian"
		  "google-chrome-stable"
		  "openssh"
		  "borgmatic"
		  "borg"
		  "racket"
		  )))

(services 
  (append
   emacs-home-service ;; Adds both the Emacs package and the init.el symlink
   (list home-openssh-service
         borgmatic-files-service
         shell-service))))
		 
	

