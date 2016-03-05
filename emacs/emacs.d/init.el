
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path (concat user-emacs-directory "/xtang-lisps"))
(require 'xtang-benchmarking)

;;; const
(defconst *is-a-mac* (eq system-type 'darwin))
(defconst *is-retina* (and window-system (>= (x-display-pixel-width) 2560)))

(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
    (when (fboundp mode) (funcall mode -1)))

;; encoding setting
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; put customize file to special file
(setq custom-file (concat user-emacs-directory "custom.el"))

;always ask for y/n keypress instead of typing out 'yes' or 'no'
(defalias 'yes-or-no-p 'y-or-n-p)

(require 'xtang-defuns)
(require 'xtang-elpa)
(require 'xtang-exec-path)
(require 'xtang-sessions)
(require 'xtang-theme)
(require 'xtang-misc)
(require 'xtang-ac)
(require 'xtang-helm)
(require 'xtang-magit)
(require 'xtang-uniquify)
(require 'xtang-editing)
(require 'xtang-social)

(message "init completed in %.2fms"
         (sanityinc/time-subtract-millis (current-time) before-init-time))
