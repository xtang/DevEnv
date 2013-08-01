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

;;----------------------------------------------------------------------------
;; Delete the current file
;;----------------------------------------------------------------------------
(defun delete-this-file ()
  "Delete the current file, and kill the buffer."
  (interactive)
  (or (buffer-file-name) (error "No file is currently being edited"))
  (when (yes-or-no-p (format "Really delete '%s'?"
                             (file-name-nondirectory buffer-file-name)))
    (delete-file (buffer-file-name))
    (kill-this-buffer)))


;;----------------------------------------------------------------------------
;; Rename the current file
;;----------------------------------------------------------------------------
(defun rename-this-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (unless filename
      (error "Buffer '%s' is not visiting a file!" name))
    (if (get-buffer new-name)
        (message "A buffer named '%s' already exists!" new-name)
      (progn
        (rename-file filename new-name 1)
        (rename-buffer new-name)
        (set-visited-file-name new-name)
        (set-buffer-modified-p nil)))))

(provide 'xtang-defuns)
