(add-to-list 'load-path user-emacs-directory)

;;; const
(defconst *is-a-mac* (eq system-type 'darwin))

(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
    (when (fboundp mode) (funcall mode -1)))

;; Always ALWAYS use UTF-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;always ask for y/n keypress instead of typing out 'yes' or 'no'
(defalias 'yes-or-no-p 'y-or-n-p)

(require 'xtang-elpa)
(require 'xtang-theme)
(require 'xtang-ac)


