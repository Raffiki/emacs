(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(defconst +home-dir+ "~")
(defconst +emacs-dir+ (concat +home-dir+ "/emacs"))
(defconst +emacs-profiles-dir+ (concat +emacs-dir+ "/profiles"))
(defconst +emacs-lib-dir+ (concat +emacs-dir+ "/libs"))
(defconst +emacs-conf-dir+ (concat +emacs-dir+ "/config"))
(defconst +emacs-tmp-dir+ (concat +emacs-dir+ "/tmp"))
(defconst +emacs-snippets-dir+ (concat +emacs-dir+ "/snippets"))

(require 'evil)
(evil-mode 1)

;; new projects will be created under this directory
(defconst +dev-dir+ (concat +home-dir+ "/dev"))

(defun add-load-path (p)
  (add-to-list 'load-path (concat +emacs-dir+ "/" p)))

(defun add-lib-path (p)
  (add-to-list 'load-path (concat +emacs-lib-dir+ "/" p)))

(defun load-conf-file (f)
  (load-file (concat +emacs-conf-dir+ "/" f ".el")))

(defun load-lib-file (f)
  (load-file (concat +emacs-lib-dir+ "/" f)))

(defun load-profile (p)
  (load-file (concat +emacs-profiles-dir+ "/" p ".el")))

(defun load-customizations ()
  (let ((filename (concat +emacs-dir+ "/custom.el")))
    (if (file-readable-p filename)
        (load-file filename))))

(add-load-path "")
(add-load-path "lib")

(load-profile "default")
(load-profile "js")
;;(load-profile "coffee")
(load-profile "golang")
;;(load-profile "clojure")

(load-customizations)

;;(add-to-list 'command-switch-alist '("clojure" . (lambda (n) (load-profile "clojure"))))
;;(add-to-list 'command-switch-alist '("ruby" . (lambda (n) (load-profile "ruby"))))
;;(add-to-list 'command-switch-alist '("android" . (lambda (n) (load-profile "android"))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#657b83" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#fdf6e3"))
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes
   (quote
    ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "b571f92c9bfaf4a28cb64ae4b4cdbda95241cd62cf07d942be44dc8f46c491f4" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(fci-rule-color "#eee8d5")
 '(frame-background-mode (quote dark))
 '(js2-basic-offset 2 t)
 '(js2-bounce-indent-p t)
 '(js2-strict-inconsistent-return-warning nil)
 '(js2-strict-missing-semi-warning nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#cb4b16")
     (60 . "#b58900")
     (80 . "#859900")
     (100 . "#2aa198")
     (120 . "#268bd2")
     (140 . "#d33682")
     (160 . "#6c71c4")
     (180 . "#dc322f")
     (200 . "#cb4b16")
     (220 . "#b58900")
     (240 . "#859900")
     (260 . "#2aa198")
     (280 . "#268bd2")
     (300 . "#d33682")
     (320 . "#6c71c4")
     (340 . "#dc322f")
     (360 . "#cb4b16"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



(projectile-global-mode)
