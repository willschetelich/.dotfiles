;; MELPA Package Manager
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Install use-package to manage configuration cleanly
(unless (package-installed-p 'use-package)
  (package-refresh-packages)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))

;; Turn off noisy file generation 
(setq make-backup-files nil) ;; this gets rid of the '~' files
(setq auto-save-default nil) ;; this disables the # files
(setq create-lockfiles nil)  ;; disables .# in files

;; Modern Auto-Save (Saves the REAL file when you switch focus/stop typing)
(use-package super-save
  :ensure t
  :config
  (super-save-mode +1)
  (setq super-save-auto-save-when-idle t
        super-save-idle-duration 3)) ;; Saves after 3 seconds of idle time

;; Essential UI Cleanup
(setq inhibit-startup-message t) ;; Skip the splash screen
(menu-bar-mode -1)               ;; Hide the top menu bar
(tool-bar-mode -1)               ;; Hide the top icon toolbar
(scroll-bar-mode -1)             ;; Hide the scrollbar for maximum screen space