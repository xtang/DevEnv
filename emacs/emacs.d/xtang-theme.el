(require-package 'zenburn-theme)
(load-theme 'zenburn t)

;; change the font and height
(when (and *is-a-mac*
	   window-system)
  (set-face-attribute 'default nil :font "Monaco" :height
                      (if *is-retina* 142 125)))

;; fullscreen
(if (functionp 'ns-toggle-fullscreen)
    (ns-toggle-fullscreen)
    (when *is-a-mac*
      (set-frame-parameter nil 'fullscreen nil)
      (set-frame-parameter nil 'fullscreen 'maximized)))

(provide 'xtang-theme)
