(setq exec-path (cons "/usr/local/lib/erlang/bin" exec-path))
(setq erlang-root-dir "/usr/local/lib/erlang")
(require-package 'erlang)
(when (not (package-installed-p 'edts))
  (package-install 'edts)
  (edts-compile-deps))

(when (and (package-installed-p 'erlang)
           (package-installed-p 'edts))
  ;(require 'erlang-start)
  ;(require 'edts-start)
  )
(provide 'xtang-erlang)
