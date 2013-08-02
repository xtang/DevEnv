(require-package 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(setq-default js2-mode-indent-ignore-first-tab t
              js2-strict-inconsistent-return-warning nil
              js2-strict-var-hides-function-arg-warning nil
              js2-strict-missing-semi-warning nil
              js2-strict-trailing-comma-warning nil
              js2-strict-cond-assign-warning nil
              js2-strict-var-redeclaration-warning nil
              js2-global-externs
              '("module" "require" "__dirname" "process" "console" "define"
                "JSON" "$" "_" "Backbone" "buster" "sinon" "moment" "_gaq"
                "Zenbox" "Mousetrap" "Comoyo"))
(provide 'xtang-js)
