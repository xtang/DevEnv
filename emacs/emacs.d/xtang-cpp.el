(dolist (hook '(c++-mode-hook c-mode-common-hook))
  (add-hook hook
            (lambda ()
              (progn
                (local-set-key (kbd "M-,") 'pop-tag-mark)))))

(provide 'xtang-cpp)
