(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files."
  (interactive)
  (dolist (buffer (buffer-list))
    (with-current-buffer buffer
      (when (and (buffer-file-name)
                 (not (buffer-modified-p)))
        (if (file-exists-p (buffer-file-name))
            (revert-buffer t t t)))))
  (message "Refresh open files."))

;; borrowed from https://github.com/purcell/emacs.d/blob/master/init-utils.el
(defmacro after-load (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
     '(progn ,@body)))

(provide 'xtang-defuns)
