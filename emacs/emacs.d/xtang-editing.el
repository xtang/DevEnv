;; default setting

(setq-default
 x-select-enable-clipboard t
 delete-selection-mode t
 mouse-drag-copy-region t
 show-trailing-whitespace t
 tab-width 4
 indent-tabs-mode nil
 line-spacing 0.2
 make-backup-files nil)

(transient-mark-mode t)
(cua-selection-mode t)

(setq sentence-end-double-space nil
      save-place-file (concat user-emacs-directory ".places")
      whitespace-style '(face trailing lines-tail lines tabs)
      whitespace-line-column 100)

;(global-auto-revert-mode)
;(setq global-auto-revert-non-file-buffers t auto-revert-verbose nil)

;; copied from https://github.com/purcell/emacs.d/blob/master/init-editing-utils.el
(dolist (hook '(term-mode-hook comint-mode-hook compilation-mode-hook))
  (add-hook hook
            (lambda () (setq show-trailing-whitespace nil))))

(add-hook 'before-save-hook
          (lambda ()
            (when buffer-file-name
              (let ((dir (file-name-directory buffer-file-name)))
                (when (and (not (file-exists-p dir))
                           (y-or-n-p (format "Directory %s does not exists. Create it?" dir)))
                  (make-directory dir t))))))

(defun esk-local-column-number-mode ()
  (make-local-variable 'column-number-mode)
  (column-number-mode t))

(defun esk-local-comment-auto-fill ()
  (set (make-local-variable 'comment-auto-fill-only-comments) t)
  (auto-fill-mode t))

(defun esk-turn-on-hl-line-mode ()
  (when (> (display-color-cells) 8)
    (hl-line-mode t)))

(defun esk-turn-on-save-place-mode ()
  (require 'saveplace)
  (setq save-place t))

(defun esk-pretty-lambdas ()
  (font-lock-add-keywords
   nil `(("(?\\(lambda\\>\\)"
          (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                    ,(make-char 'greek-iso8859-7 107))
                    nil))))))

(defun esk-add-watchwords ()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\(ME\\)?\\|TODO\\|HACK\\|REFACTOR\\|NOCOMMIT\\|DEPRECATED\\)"
          1 font-lock-warning-face t))))

(add-hook 'prog-mode-hook 'esk-local-column-number-mode)
(add-hook 'prog-mode-hook 'esk-local-comment-auto-fill)
(add-hook 'prog-mode-hook 'esk-turn-on-hl-line-mode)
(add-hook 'prog-mode-hook 'esk-turn-on-save-place-mode)
(add-hook 'prog-mode-hook 'esk-pretty-lambdas)
(add-hook 'prog-mode-hook 'esk-add-watchwords)
(add-hook 'prog-mode-hook 'whitespace-mode)

;; idle-highlight-mode
(require-package 'idle-highlight-mode)
(add-hook 'prog-mode-hook 'idle-highlight-mode)

;; paredit
(require-package 'paredit)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)

;; Show matching parens
(require-package 'mic-paren)
(paren-activate)     ; activating mic-paren

;; ace jump mode
(require-package 'ace-jump-mode)
(global-set-key (kbd "C-;") 'ace-jump-mode)
(global-set-key (kbd "C-:") 'ace-jump-word-mode)

;; ack
(require-package 'ack-and-a-half)
(defalias 'ack 'ack-and-a-half)
(defalias 'ack-same 'ack-and-a-half-same)
(defalias 'ack-find-file 'ack-and-a-half-find-file)
(defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)

;; recentf
(recentf-mode 1)
(setq recentf-max-saved-items 1000
      recentf-exclude '("/tmp/" "/ssh:"))

;; keybinding
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "M-n") 'mark-sexp)
(global-set-key (kbd "C-x C-n") (lambda () (interactive) (other-window 1)))
(global-set-key (kbd "C-x C-p") (lambda () (interactive) (other-window -1)))

;; buffer-move
(require-package 'buffer-move)
(global-set-key (kbd "C-c C-n") (lambda () (interactive) (buf-move-right)))
(global-set-key (kbd "C-c C-p") (lambda () (interactive) (buf-move-left)))

;; string-inflection
(require-package 'string-inflection)
(global-set-key (kbd "C-c C-u") 'string-inflection-cycle) ; Vz Editor-like key binding

;; move-text
(require-package 'move-text)
(move-text-default-bindings)
(global-set-key (kbd "M-<up>") 'move-text-up)
(global-set-key (kbd "M-<down>") 'move-text-down)

;; multiple-cursor
(require-package 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; mac related
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; language specific require
(require 'xtang-clj)
(require 'xtang-go)
(require 'xtang-lisp)
(require 'xtang-hbs)
(require 'xtang-js)
(require 'xtang-org)
(require 'xtang-cpp)
(require 'xtang-markdown)
(require 'xtang-sass)
(require 'xtang-less-css)
(require 'xtang-coffee)
(require 'xtang-yasnippet)
(require 'xtang-scss)
(require 'xtang-gist)
(require 'xtang-html)
(require 'xtang-erlang)
(require 'xtang-docker)

(provide 'xtang-editing)
