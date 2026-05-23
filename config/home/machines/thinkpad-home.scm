(define-module (config home machines thinkpad-home)
  #:use-module (gnu)
  #:use-module (gnu home)
  #:use-module (config home base-home))

;; thinkpad = base home + a few extras. Names resolve via the nonguix
;; channel (already required for the current config), so no nongnu module
;; imports are needed here.
(home-environment
 (inherit base-home)
 ;; NOTE: Obsidian is not packaged in Guix or nonguix (proprietary Electron
 ;; app), so it can't go here. Install it out-of-band, e.g. via Flatpak:
 ;;   flatpak install flathub md.obsidian.Obsidian
 (packages (append (specifications->packages
                    (list "google-chrome-stable"
                          "lilypond"))
                   base-home-packages)))
