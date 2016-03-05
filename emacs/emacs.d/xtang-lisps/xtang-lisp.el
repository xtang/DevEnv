(require-package 'auto-compile)
(require-package 'rainbow-delimiters)

(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)

(auto-compile-on-save-mode 1)
(auto-compile-on-load-mode 1)

(provide 'xtang-lisp)
