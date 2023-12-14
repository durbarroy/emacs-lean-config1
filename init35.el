(setq comp-deferred-compilation nil)
(setq gc-cons-threshold (* 50 1000 1000))
(setq frame-inhibit-implied-resize t) ;; prevent resize window on startup
(setq default-frame-alist '((top . 1)
                                    (left . 0)
                                    (width . 101)
                                    (height . 23)))

(setq load-path (cons "~/.emacs.d/dotemacs/" load-path))

(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(
;;                         ("ELPA" . "https://tromey.com/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
;;			 ("org" . "https://orgmode.org/elpa/")
))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file 'noerror)

(setq gc-cons-threshold (* 50 1000 1000))
