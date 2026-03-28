;; Melpha
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; turn off noisy file generation 
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)



;; in Org Babel
;; Load the language
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

;; Point to the correct executable
(setq org-babel-python-command "python3")

;; Prevent Emacs from creating a separate .emacs.d for internal storage
(setq user-emacs-directory "~/.config/emacs/")

(setq org-agenda-files '("~/org/"))

(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "MUSIC-TODO" | "DONE" "CANCELLED")))

(setq org-return-follows-link nil)
