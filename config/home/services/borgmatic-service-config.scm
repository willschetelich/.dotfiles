(define-module (config home services borgmatic-service-config)
  #:use-module (gnu home services)
  #:use-module (gnu services)
  #:use-module (guix gexp)

  #:export (borgmatic-files-service))

(define borgmatic-files-service
  (service home-files-service-type
			  `((".config/borgmatic/config.yaml"
			     ,(local-file "/home/will/.dotfiles/files/borgmatic-config.yaml")))))
(define-module (config home services borgmatic-service-config)
  #:use-module (gnu home services)
  #:use-module (gnu services)
  #:export (borgmatic-files-service))

(define borgmatic-files-service
  (service home-files-service-type
			  `((".config/borgmatic/config.yaml"
			     ,(local-file "/home/will/.dotfiles/files/borgmatic-config.yaml")))))
