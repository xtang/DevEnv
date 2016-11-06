(require-package 'helm)

(global-set-key (kbd "M-x") 'helm-M-x)
; (global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "<M-return>") 'helm-for-files)
(setq helm-split-window-default-side "right")

(provide 'xtang-helm)
