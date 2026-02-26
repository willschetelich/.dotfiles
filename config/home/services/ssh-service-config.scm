(define-module (config home services ssh-service-config)
  #:use-module (gnu services)
  #:use-module (gnu home services ssh)
  #:export (home-open-ssh-service))

  (define home-openssh-service
    (service home-openssh-service-type
			  (home-openssh-configuration
			   (add-keys-to-agent "yes")
			   (hosts
			    (list (openssh-host (name "github.com")
						(user "git")
						(identity-file "~/.ssh/id_ed25519")
						))))))
