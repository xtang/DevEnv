(require-package 'go-mode)
(require-package 'go-autocomplete)

;(require 'go-mode-autoloads)
(require 'go-autocomplete)

(defun go-run ()
  (interactive)
  (let ((cmd (concat "go run " (buffer-file-name))))
    (message "running...:%s" cmd)
    (shell-command cmd "*run-go-file-output*")))

(add-hook 'go-mode-hook '(lambda () (progn
                                 (whitespace-mode -1)
                                 (local-set-key (kbd "M-.") 'godef-jump)
                                 (local-set-key (kbd "M-,") 'pop-tag-mark)
                                 (local-set-key (kbd "s-r") 'go-run))))

(add-hook 'before-save-hook 'gofmt-before-save)

(provide 'xtang-go)
