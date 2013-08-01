(require-package 'clojure-mode)
(require-package 'nrepl)
(require-package 'ac-nrepl)
(require-package 'rainbow-delimiters)

(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

(setq nrepl-popup-stacktraces nil)

(after-load 'nrepl
  (add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
  (add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
  (after-load 'auto-complete
    (add-to-list 'ac-modes 'nrepl-mode))

  ;(add-hook 'nrepl-mode-hook 'set-auto-complete-as-completion-at-point-function)
  ;(add-hook 'nrepl-interaction-mode-hook 'set-auto-complete-as-completion-at-point-function)
  ;(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
  ;(add-hook 'nrepl-mode-hook 'subword-mode)
  (add-hook 'nrepl-mode-hook 'paredit-mode)
  ;(define-key nrepl-interaction-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)

  ;; nrepl isn't based on comint
  (add-hook 'nrepl-mode-hook
            (lambda () (setq show-trailing-whitespace nil))))



(provide 'xtang-clj)
