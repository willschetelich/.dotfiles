(define-module (config home base-home)
 #:use-module (gnu)
 #:use-module (gnu home) ;; gives home-environment and specifications packages
 #:use-module (gnu home services) ;; provides basic services
 #:use-module (config home services emacs)
 #:use-module (config home services ssh-service-config) ;; imports custom config
 #:use-module (config home services shell-services-config)
 #:export (base-home
           base-home-packages
           base-home-services))

;; Packages every machine gets. Machine-specific extras live in
;; config/home/machines/<hostname>.scm and append to this list.
(define base-home-packages
  (specifications->packages
   (list "git"
         "openssh")))

;; Services every machine gets.
(define base-home-services
  (append
   emacs-home-service ;; Adds both the Emacs package and the init.el symlink
   (list home-openssh-service
         shell-service)))

;; The shared base home environment. Per-machine files do
;; (home-environment (inherit base-home) ...) and override individual fields.
(define base-home
  (home-environment
   (packages base-home-packages)
   (services base-home-services)))
