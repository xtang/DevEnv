(require-package 'zenburn-theme)
(require-package 'solarized-theme)
;; patch

;; Use less bolding
;; (load-theme 'solarized-dark t)
(load-theme 'zenburn t)
;; (load-theme 'monokai t)
(zenburn-with-color-variables
  (custom-theme-set-faces
   'zenburn
   `(highlight ((t (:background ,zenburn-bg+3))))
   `(region ((,class (:background ,zenburn-bg+3))
             (t :inverse-video t)))
   `(hl-line-face ((,class (:background ,"gray18"))
                   (t :weight bold)))
   `(hl-line ((,class (:background ,"gray18"))
              (t :weight bold)))))

(fringe-mode (cons 1 1))

(set-face-attribute 'default nil :font "Source Code Pro" :height 126)

;; change the font and height
(when (and *is-a-mac*
           window-system)
  (set-face-attribute 'default nil :font "Monaco" :height
                      (if *is-retina* 166 166)))

(set-fontset-font t 'han (font-spec :name "STHeiti"))

;; fullscreen
;(if (functionp 'ns-toggle-fullscreen)
;    (ns-toggle-fullscreen)
;  (when *is-a-mac*
;    (set-frame-parameter nil 'fullscreen nil)
;    (set-frame-parameter nil 'fullscreen 'maximized)))

(provide 'xtang-theme)
