(require-package 'magit)
(global-set-key (kbd "C-x g") 'magit-status)


;; (eval-after-load 'magit
;;   '(progn
;;      (set-face-foreground 'magit-diff-add "green4")
;;      (set-face-foreground 'magit-diff-del "red3")))

(provide 'xtang-magit)
