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
		  )))
 (services (list (service home-openssh-service-type
			  (home-openssh-configuration
			   (add-keys-to-agent "yes")
			   (hosts
			    (list (openssh-host (name "github.com")
						(user "git")
						(identity-file "~/.ssh/id_ed25519")
						)))))
		 (simple-service 'borgmatic-config
                      home-xdg-configuration-files-service-type
                      `(("borgmatic/config.yaml"
                         ,(plain-file "borgmatic-config.yaml"
                           "source_directories:\n\
  - /home/will/peitho-test\n\
  - /home/will/external-ace\n\
  - /home/will/.dotfiles\n\
\n\
repositories:\n\
  - path: /mnt/flashdrive/\n\
    label: flashdrive\n")))))))

