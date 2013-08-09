(add-hook 'org-mode-hook '(lambda () (progn
                                 (local-unset-key (kbd "M-<return>")))))
(setq org-log-done t)
(provide 'xtang-org)
