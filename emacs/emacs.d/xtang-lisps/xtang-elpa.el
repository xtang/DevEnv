;; ELPA
(require 'package)
(dolist (source '(("melpa" . "https://melpa.org/packages/")
                  ("marmalade" . "http://marmalade-repo.org/packages/")
                  ("elpa" . "http://tromey.com/elpa/")))
  (add-to-list 'package-archives source t))

(package-initialize)
; (add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
(unless package-archive-contents (package-refresh-contents))

(defun require-package (pkg)
  "Install a package only if it's not already installed."
  (when (not (package-installed-p pkg))
    (package-install pkg)))

(provide 'xtang-elpa)
