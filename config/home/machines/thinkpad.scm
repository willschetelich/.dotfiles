(define-module (config home machines thinkpad)
  #:use-module (gnu)
  #:use-module (gnu home)
  #:use-module (config home base-home))

;; thinkpad = base home + a few extras. Names resolve via the nonguix
;; channel (already required for the current config), so no nongnu module
;; imports are needed here.
(home-environment
 (inherit base-home)
 (packages (append (specifications->packages
                    (list "obsidian"
                          "google-chrome-stable"
                          "lilypond"))
                   base-home-packages)))
