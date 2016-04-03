(add-lib-path "js2-mode-compiled")

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;;(add-to-list 'auto-mode-alist '("\\.jsx$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))

(custom-set-variables '(js2-strict-inconsistent-return-warning nil))
(custom-set-variables '(js2-strict-missing-semi-warning nil))
(custom-set-variables  
   '(js2-basic-offset 2)  
    '(js2-bounce-indent-p t)  
    )

(setq js-indent-level 2)
(setq js2-indent-level 2)
(setq js2-basic-offset 2)

(add-hook 'js2-mode-hook '(lambda ()
                            (local-set-key (kbd "RET") 'newline-and-indent)))

(add-to-list 'load-path "~/Projects/raf/tern/emacs")
(autoload 'tern-mode "tern.el" nil t)
(add-hook 'js2-mode-hook '(lambda () (tern-mode t)))

(eval-after-load 'tern
    '(progn
       (require 'tern-auto-complete)
                                   (tern-ac-setup)))

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'js2-mode-hook '(lambda () (flycheck-select-checker 'javascript-standard)))
;(flycheck-select-checker 'javascript-standard)
