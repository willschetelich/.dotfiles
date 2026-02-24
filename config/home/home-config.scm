(use-modules (gnu)
	     (gnu home)
	     (nongnu packages chrome)
	     (nongnu packages productivity)
	     (gnu home services ssh)
	     )
	  

(home-environment
 (packages (specifications->packages
	    (list "git"
		  "emacs"
		  "obsidian"
		  "google-chrome-stable"
		  "openssh"
		  )))
 (services (list (service home-openssh-service-type
			  (home-openssh-configuration
			   (add-keys-to-agent "yes") ;; testing 123
			   (hosts
			    (list (openssh-host (name "github.com")
						(user "git")
						(identity-file "~/.ssh/id_ed25519")
					
						)))))))
)
