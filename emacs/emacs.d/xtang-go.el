(require-package 'go-mode)
(require-package 'go-autocomplete)

(require 'go-mode-load)
(require 'go-autocomplete)

(add-hook 'go-mode-hook '(lambda () (progn
                                 (whitespace-mode -1)
                                 (local-set-key (kbd "M-.") 'godef-jump)
                                 (local-set-key (kbd "M-,") 'pop-tag-mark))))

(add-hook 'before-save-hook 'gofmt-before-save)

(provide 'xtang-go)
