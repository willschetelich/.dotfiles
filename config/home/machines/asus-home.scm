(define-module (config home machines asus-home)
  #:use-module (gnu home)
  #:use-module (config home base-home))

;; asus = base home only, no machine-specific extra packages.
(home-environment
 (inherit base-home))
