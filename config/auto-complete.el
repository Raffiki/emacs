(add-lib-path "auto-complete")
(add-lib-path "popup")

(require 'auto-complete)
(require 'auto-complete-config)

(ac-config-default)
(ac-flyspell-workaround)
(add-to-list 'ac-dictionary-directories (concat +emacs-lib-dir+ "/auto-complete/dict"))

(setq ac-comphist-file (concat +emacs-tmp-dir+ "/ac-comphist.dat"))

(global-auto-complete-mode t)
(setq ac-auto-show-menu t)
(setq ac-dwim t)
(setq ac-use-menu-map t)
(setq ac-quick-help-delay 1)
(setq ac-quick-help-height 60)
(setq ac-ignore-case nil)

(set-default 'ac-sources
             '(ac-source-dictionary
               ac-source-yasnippet
               ac-source-imenu
               ac-source-abbrev
               ac-source-files-in-current-dir
               ac-source-filename
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
               ac-source-words-in-all-buffer))

(dolist (mode '(magit-log-edit-mode log-edit-mode org-mode text-mode haml-mode
                sass-mode yaml-mode csv-mode espresso-mode haskell-mode
                html-mode nxml-mode sh-mode smarty-mode clojure-mode
                lisp-mode javascript-mode textile-mode markdown-mode tuareg-mode))
  (add-to-list 'ac-modes mode))

;;Key triggers
(ac-set-trigger-key "TAB")
(define-key ac-completing-map (kbd "C-M-n") 'ac-next)
(define-key ac-completing-map (kbd "C-M-p") 'ac-previous)
(define-key ac-completing-map "\t" 'ac-complete)
(define-key ac-completing-map "\r" nil)
