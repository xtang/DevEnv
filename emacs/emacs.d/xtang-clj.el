(require-package 'clojure-mode)
(require-package 'clojure-test-mode)
(require-package 'cider)
(require-package 'ac-cider-compliment)
(require-package 'rainbow-delimiters)

(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

(setq cider-popup-stacktraces nil)

(after-load 'cider
  (add-hook 'cider-mode-hook 'ac-cider-setup)
  (add-hook 'cider-interaction-mode-hook 'ac-cider-setup)
  (after-load 'auto-complete
    (add-to-list 'ac-modes 'cider-mode))

  ;(add-hook 'nrepl-mode-hook 'set-auto-complete-as-completion-at-point-function)
  ;(add-hook 'nrepl-interaction-mode-hook 'set-auto-complete-as-completion-at-point-function)
  ;(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
  ;(add-hook 'nrepl-mode-hook 'subword-mode)
  (add-hook 'cider-mode-hook 'paredit-mode)
  ;(define-key nrepl-interaction-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)

  ;; nrepl isn't based on comint
  (add-hook 'cider-mode-hook
            (lambda () (setq show-trailing-whitespace nil))))



(provide 'xtang-clj)
