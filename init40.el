;;(setq comp-deferred-compilation nil)
(setq gc-cons-threshold (* 50 1000 1000))
(setq frame-inhibit-implied-resize t) ;; prevent resize window on startup
(setq default-frame-alist '((top . 1)
                                    (left . 0)
                                    (width . 101)
                                    (height . 23)))


(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(
;;                         ("ELPA" . "https://tromey.com/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
;;			 ("org" . "https://orgmode.org/elpa/")
))
(package-initialize)

(setq inhibit-startup-message t)

(setq initial-scratch-message
      ";; Emacs is the greatest LISP machine!!!\n;; This buffer is for text that is not saved, and for Lisp evaluation.\n;; To create a file, visit it with C-x C-f and enter text in its buffer.\n\n")

(setq default-directory "~/Sync/")

(setq load-path (cons "~/.emacs.d/dotemacs/" load-path))

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(setq display-time-24hr-format t)
(display-time-mode 1)

(line-number-mode 1)
(column-number-mode 1)

(require 'recentf)
(recentf-mode 1)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(defvar my-term-shell "/bin/bash")
(defadvice ansi-term (before force-bash)
(interactive (list my-term-shell)))
(ad-activate 'ansi-term)
(defalias 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "<s-return>") 'ansi-term)
;;(global-set-key (kbd "<s-return>") 'vterm)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(setq org-agenda-files '("~/Sync/3_resources/my_multiverse/notes/linux_android/org_capture_and_agenda2/"))


(setq org-capture-templates
       '(("t" "Todo" entry (file "~/Sync/3_resources/my_multiverse/notes/linux_android/org_capture_and_agenda2/capture.org")
          "* TODO %^{Title} :%^{Tags}:\n%U%i\n%?\n")
         ("c" "Capture anything" entry (file "~/Sync/3_resources/my_multiverse/notes/linux_android/org_capture_and_agenda2/capture.org")
          "* %^{Title} :%^{Tags}:\n%U%i\n%?\n")
         ))

(setq org-image-actual-width nil)

(setq org-log-done 'time)

(setq scroll-conservatively 100)

(setq ring-bell-function 'ignore)

(setq make-backup-files nil)
(setq auto-save-default nil)

(add-to-list 'load-path "~/.emacs.d/manual_packages")

(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file 'noerror)

(autoload 'kill-all-buffers "emacs-buffers")
(global-set-key (kbd "C-M-s-k") 'kill-all-buffers)


(global-set-key (kbd "C-x b") 'ibuffer)

(setq ibuffer-expert t)

(autoload 'kill-curr-buffer "emacs-buffers")
(global-set-key (kbd "C-x k") 'kill-curr-buffer)

(savehist-mode +1)
(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))

(setq bookmark-set-fringe-mark nil)

(global-subword-mode 1)

(delete-selection-mode -1)

(save-place-mode +1)

(setq case-fold-search t)

(setq sentence-end-double-space nil)

;;(when window-system (global-hl-line-mode t))
;;(when window-system (global-prettify-symbols-mode t))


;;(set-background-color "honeydew")
;;(set-background-color "light yellow")
;;(set-background-color "light gray")
;;(set-background-color "gainsboro")
;;(set-background-color "white smoke")

;;(set-face-attribute 'region nil :background "pale green" :foreground "black")
;;(set-face-attribute 'region nil :background "yellow" :foreground "black")
;;(set-face-attribute 'region nil :background "lime green" :foreground "black")

;;(set-face-attribute 'region nil :background "light goldenrod" :foreground "black")

;;(set-cursor-color "red")

(autoload 'config-visit "emacs-config")
(global-set-key (kbd "C-c e") 'config-visit)

(autoload 'config-reload "emacs-config")
(global-set-key (kbd "C-c r") 'config-reload)

(autoload 'split-and-follow-horizontally "emacs-window-split")
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)
(autoload 'split-and-follow-vertically "emacs-window-split")
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)


(autoload 'kill-whole-word "emacs-convenient-functions")
(global-set-key (kbd "C-c w w") 'kill-whole-word)


;; (setq org-babel-python-command "/usr/bin/python3")
(setq org-babel-python-command "/home/durbar/Python/scicomp/bin/python3")


(org-babel-do-load-languages
     'org-babel-load-languages
     '((python . t)
    ;;   (ipython .t)
    ;;   (perl . t)
       (C .t)
       (shell . t)
       (latex . t)
    ;;   (R .t)
    ;;   (awk . t)
    ;;   (gnuplot . t)
    ;; (cpp .t)
    ;;   (julia . t)
       ))


(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'org-mode-hook 'org-indent-mode)
(setq org-fold-catch-invisible-edits nil)

(display-battery-mode)

(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "brave-browser-stable")

(show-paren-mode 1)

(add-to-list 'exec-path "/home/durbar/.local/bin/")

(require 'emacs-xah-lee)

;;(set-frame-parameter (selected-frame) 'alpha '(93 .80))
;;(add-to-list 'default-frame-alist '(alpha . (93 . 80)))

(setq diary-file "~/Sync/3_resources/my_multiverse/notes/linux_android/emacs_diary/diary")



(use-package vertico
    :ensure t
    :init
    (vertico-mode))

(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
	'(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Support opening new minibuffers from inside existing minibuffers.
  (setq enable-recursive-minibuffers t)

  ;; Emacs 28 and newer: Hide commands in M-x which do not work in the current
  ;; mode.  Vertico commands are hidden in normal buffers. This setting is
  ;; useful beyond Vertico.
  (setq read-extended-command-predicate #'command-completion-default-include-p))

(use-package olivetti
  :ensure t)


(use-package orderless
    :ensure t
    :init
    ;; Configure a custom style dispatcher (see the Consult wiki)
    ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
    ;;       orderless-component-separator #'orderless-escapable-split-on-space)
    (setq completion-styles '(orderless basic)
          completion-category-defaults nil
          completion-category-overrides '((file (styles partial-completion)))))

(use-package marginalia
    :ensure t
    :config (marginalia-mode))

(use-package company
  :ensure t)

;;(set-face-foreground 'mode-line "white")
;;(set-face-background 'mode-line "dark green")
;;(set-face-background 'mode-line "forest green")
;;(set-face-background 'mode-line-inactive "light green")

(use-package swiper
    :ensure t
    :bind ("C-s" . 'swiper))


(use-package which-key
    :ensure t
    :commands which-key-mode)


(use-package consult
  :ensure t)


(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/Sync/3_resources/my_multiverse/notes/linux_android/org_roam3/")
  (org-roam-completion-everywhere t)
  (org-roam-capture-templates
   '(
     ("d" "default" plain
      "%?"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)
     ("l" "programming language" plain
 "* Characteristics\n\n- Family: %?\n- Inspired by: \n\n* Reference:\n\n"
 :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
 :unnarrowed t)
     ("b" "book notes" plain
 "\n* Source\n\nAuthor: %^{Author}\nTitle: ${title}\nYear: %^{Year}\n\n* Summary\n\n%?"
 :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
 :unnarrowed t)
     ("p" "project" plain "* Goals\n\n%?\n\n* Tasks\n\n** TODO Add initial tasks\n\n"
 :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: project")
 :unnarrowed t)
     ))
  :bind (("C-c n l" . org-roam-buffer-toggle)
	 ("C-c n f" . org-roam-node-find)
	 ("C-c n i" . org-roam-node-insert)
	 :map org-mode-map
	 ("C-M-i" . completion-at-point)
	 :map org-roam-dailies-map
	 ("Y" . org-roam-dailies-capture-yesterday)
	 ("T" . org-roam-dailies-capture-tomorrow))
  :bind-keymap
  ("C-c n d" . org-roam-dailies-map)
  :config
  ;;(org-roam-setup)
  (require 'org-roam-dailies)
  (org-roam-db-autosync-mode t))

(defun org-roam-node-insert-immediate (arg &rest args)
    (interactive "P")
    (let ((args (cons arg args))
          (org-roam-capture-templates (list (append (car org-roam-capture-templates)
                                                    '(:immediate-finish t)))))
      (apply #'org-roam-node-insert args)))

(global-set-key (kbd "C-c n I") 'org-roam-node-insert-immediate)

;;(setq org-roam-dailies-directory "journal")
  (setq org-roam-dailies-capture-templates
	'(("d" "default" entry "* %<%I:%M %p>: %?"
	   :if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n"))
	  ("o" "others" entry "* %?"
	   :if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n"))
	  ))

(use-package org-roam-ui
    :ensure t
    :after org-roam
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

(defun durbar/rg-search-notes ()
    ;;defun bms/org-roam-rg-search ()
    "Search org-roam directory using consult-ripgrep. With live-preview."
    ;;(setq org-roam-directory "~/Sync/3_resources/my_multiverse/notes/linux_android/org_roam3/")
    (setq notes-search-directory "~/Sync/3_resources/my_multiverse/notes/linux_android/")
    (interactive)
    (let ((consult-ripgrep-command "rg --null --ignore-case --type org --line-buffered --color=always --max-columns=500 --no-heading --line-number . -e ARG OPTS"))
      ;;(consult-ripgrep org-roam-directory)
      (consult-ripgrep notes-search-directory)
      ))
(global-set-key (kbd "C-c f") 'durbar/rg-search-notes)

;; (use-package org-ref
;;     :ensure t
;;     :config
;;     (setq
;;      bibtex-completion-bibliography '("~/Sync/3_resources/literature_database/bibliography.bib")
;;      bibtex-completion-notes-path "~/Sync/3_resources/literature_database/literature_notes/"
;;      ;;   bibtex-completion-pdf-field "file"
;;      bibtex-completion-library-path "~/Sync/3_resources/literature_database/literature_pdfs/"
;;      bibtex-completion-pdf-open-function
;;      (lambda (fpath)
;;        (call-process "xdg-open" nil 0 nil fpath))))

;; (use-package ivy-bibtex
;;     :ensure t
;;     :after org-ref)

;; (use-package org-roam-bibtex
;;     :ensure t  
;;     :after org-roam
;;     :hook (org-roam-mode . org-roam-bibtex-mode)
;; ;;    :bind
;; ;;    (("C-c r z" . orb-insert-link))
;;     :config
;;     (require 'org-ref))

(use-package yasnippet
    :ensure t
    :config
    (setq yas-snippet-dirs '("~/Sync/3_resources/yasnippet/snippets")))

(require 'yasnippet)
(yas-global-mode 1)
(yas-reload-all)

(use-package djvu
  :ensure t)

(use-package nov
  :ensure t)

(use-package markdown-mode
  :ensure t)

(use-package hyperbole
    :ensure t
    :config
    (require 'hyperbole)
    :bind* ("M-<return>" . hkey-either))

(hyperbole-mode 1)



(use-package eradio
    :ensure t
    :init
    (setq eradio-player '("mpv" "--no-video" "--no-terminal"))
    :config
    (setq eradio-channels '(("Totally 80s FM" .
                             "https://zeno.fm/radio/totally-80s-fm/")
                            ))
    )


(setq pdf-view-use-unicode-ligther nil)

(use-package pdf-tools
     :ensure t
     :config
;; ;;    (pdf-tools-install)
     (pdf-loader-install))

(use-package org-pdftools
  :ensure t)



(eval-after-load 'org '(require 'org-pdftools))

(setq pdf-view-midnight-colors '("#f8f8f2" . "#2e3436"))  ;;; background color of tango dark emacs theme: #2e3436

(add-to-list 'org-file-apps 
             '("\\.pdf\\'" . (lambda (file link)
                               (org-pdftools-open link))))


(use-package hide-mode-line 
  :ensure t)



(setq font-lock-extra-managed-props (delq 'help-echo font-lock-extra-managed-props))
(require 'emacs-highlight-annotation-mode)
(global-set-key (kbd "s-y") 'highlight-region-yellow)

(setq font-lock-extra-managed-props (delq 'help-echo font-lock-extra-managed-props))
(global-set-key (kbd "s-b") 'highlight-region-blue)

(setq font-lock-extra-managed-props (delq 'help-echo font-lock-extra-managed-props))
(global-set-key (kbd "s-g") 'highlight-region-green)

(setq font-lock-extra-managed-props (delq 'help-echo font-lock-extra-managed-props))
(global-set-key (kbd "s-d") 'highlight-region-red)

(add-hook 'after-save-hook 'highlight-save)

(add-hook 'org-mode-hook 'highlight-load)

(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
               '("org-plain-latex"
                 "\\documentclass{article}
             [NO-DEFAULT-PACKAGES]
             [PACKAGES]
             [EXTRA]"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

(use-package vterm
  :ensure t)

(use-package ef-themes
  :ensure t)

(use-package standard-themes
  :ensure t)

(require 'sr-speedbar)
(setq speedbar-use-images nil)


(setq gc-cons-threshold (* 50 1000 1000))
