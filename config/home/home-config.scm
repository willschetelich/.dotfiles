(use-modules (gnu)
	     (gnu home)
	     (gnu home services)
	     (nongnu packages chrome)
	     (nongnu packages productivity)
	     (gnu home services ssh)
	     (gnu services backup)
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
 (services (list (service home-openssh-service-type
			  (home-openssh-configuration
			   (add-keys-to-agent "yes")
			   (hosts
			    (list (openssh-host (name "github.com")
						(user "git")
						(identity-file "~/.ssh/id_ed25519")
						)))))
		 (service home-files-service-type
			  `((".config/borgmatic/config.yaml"
			     ,(local-file "/home/will/.dotfiles/files/borgmatic-config.yaml"))))
	)))

