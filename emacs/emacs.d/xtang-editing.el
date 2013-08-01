;; default setting
(setq-default
 x-select-enable-clipboard t
 delete-selection-mode t
 mouse-drag-copy-region t
 show-trailing-whitespace t
 make-backup-files nil)

(transient-mark-mode t)
(cua-selection-mode t)

(setq sentence-end-double-space nil
      whitespace-style '(face trailing lines-tail tabs)
      whitespace-line-column 120)

;; copied from https://github.com/purcell/emacs.d/blob/master/init-editing-utils.el
(dolist (hook '(term-mode-hook comint-mode-hook compilation-mode-hook))
  (add-hook hook
            (lambda () (setq show-trailing-whitespace nil))))

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
   nil '(("\\<\\(FIX\\(ME\\)?\\|TODO\\|HACK\\|REFACTOR\\|NOCOMMIT\\)"
          1 font-lock-warning-face t))))

(add-hook 'prog-mode-hook 'esk-local-column-number-mode)
(add-hook 'prog-mode-hook 'esk-local-comment-auto-fill)
(add-hook 'prog-mode-hook 'esk-turn-on-hl-line-mode)
(add-hook 'prog-mode-hook 'esk-turn-on-save-place-mode)
(add-hook 'prog-mode-hook 'esk-pretty-lambdas)
(add-hook 'prog-mode-hook 'esk-add-watchwords)


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

;; keybinding
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "M-n") 'mark-sexp)
(global-set-key (kbd "C-x C-n") (lambda () (interactive) (other-window 1)))

;; language specific require
(require 'xtang-clj)

(provide 'xtang-editing)
