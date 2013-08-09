(add-hook 'org-mode-hook '(lambda () (progn
                                 (local-unset-key (kbd "M-<return>")))))
(provide 'xtang-org)
