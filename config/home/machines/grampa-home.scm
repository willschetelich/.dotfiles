(define-module (config home machines grampa-home)
  #:use-module (gnu)
  #:use-module (gnu home)
  #:use-module (config home base-home))

;; grampa = base home + audio/notation tooling.
(home-environment
 (inherit base-home)
 (packages (append (specifications->packages
                    (list "lilypond"
                          "ardour"))
                   base-home-packages)))
