(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1))

(setq inhibit-startup-message t
      oddmuse-directory (concat user-emacs-directory "oddmuse"))

(provide 'xtang-misc)
