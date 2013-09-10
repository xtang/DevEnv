(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1))

(setq inhibit-startup-message t
      oddmuse-directory (concat user-emacs-directory "oddmuse"))

(require 'url)
(defun download-file (&optional url download-dir download-name)
  (interactive)
  (let ((url (or url
                 (read-string "Enter download URL: "))))
    (let ((download-buffer (url-retrieve-synchronously url)))
      (save-excursion
        (set-buffer download-buffer)
        ;; we may have to trim the http response
        (goto-char (point-min))
        (re-search-forward "^$" nil 'move)
        (forward-char)
        (delete-region (point-min) (point))
        (let ((localfile-name (concat (or download-dir
                                          "~/emacs-downloads/")
                                      (or download-name
                                          (car (last (split-string url "/" t)))))))
          (write-file localfile-name)
          (find-file localfile-name))))))

(provide 'xtang-misc)
