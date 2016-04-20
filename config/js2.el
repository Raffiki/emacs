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

(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (file-executable-p eslint)
      (setq-local flycheck-javascript-eslint-executable eslint))))

;(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'js2-mode-hook 'flycheck-mode)
;(add-hook 'js2-mode-hook '(lambda () (flycheck-select-checker 'javascript-standard)))
;;(add-hook 'js2-mode-hook '(lambda () (flycheck-select-checker 'javascript-eslint )))
(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)
;(flycheck-select-checker 'javascript-standard)
