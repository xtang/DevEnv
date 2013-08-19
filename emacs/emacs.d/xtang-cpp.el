(add-hook 'c++-mode-hook (lambda ()
                           (progn
                             (local-set-key (kbd "M-,") 'pop-tag-mark))))

(provide 'xtang-cpp)
