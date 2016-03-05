(require-package 'less-css-mode)
(add-hook 'less-css-mode-hook
  (lambda ()
    (set (make-local-variable 'css-indent-offset) 2)))
(provide 'xtang-less-css)
