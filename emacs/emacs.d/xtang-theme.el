(require-package 'zenburn-theme)
(load-theme 'zenburn t)

(if (functionp 'ns-toggle-fullscreen)
    (ns-toggle-fullscreen)
    (when *is-a-mac*
      (set-frame-parameter nil 'fullscreen nil)
      (set-frame-parameter nil 'fullscreen 'maximized)))

(provide 'xtang-theme)
