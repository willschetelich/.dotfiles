(define-module (config home home-config)
 #:use-module (gnu)
 #:use-module (gnu home) ;; gives home-environment and specifications packages
 #:use-module (gnu home services) ;; provides basic services
 #:use-module (nongnu packages chrome)
 #:use-module (nongnu packages productivity)
 #:use-module (gnu services backup)
 #:use-module (config home services ssh-service-config) ;; imports custom config
 #:use-module (config home services borgmatic-service-config) 
	     )
	  

(home-environment
 (packages (specifications->packages
	    (list "git"
		  "emacs"
		  "obsidian"
		  "google-chrome-stable"
		  "openssh"
		  "borgmatic"
		  "borg"
		  )))

 (services (list
	    home-openssh-service
	    borgmatic-files-service 
	    )
	   )
 )
	

