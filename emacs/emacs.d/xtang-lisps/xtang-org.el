(add-hook 'org-mode-hook '(lambda () (progn
                                 (local-unset-key (kbd "M-<return>"))
                                 (local-unset-key (kbd "M-RET")))))
(setq org-log-done t)
(provide 'xtang-org)
