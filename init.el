;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; setup el-get the super package manager
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

;; add MELPA source to 'package.el' the solemn package manager
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
; see http://stackoverflow.com/questions/11127109/emacs-24-package-system-initialization-problems/11140619#11140619
;(setq packagte-enable-at-startup nil)
;(package-initialize)
(require 'el-get-elpa)
;; actually this is bad, because directory exists has nothing to do with the assert that
;; all recipes of repos in 'package-archives are loaded properly
(unless (file-directory-p el-get-recipe-path-elpa)
    (el-get-elpa-build-local-recipes))

;;;;;;;;;;;;;;;;;;;;;;;;;
;; set up el-get packages
;;;;;;;;;;;;;;;;;;;;;;;;;
;; setup el-get packages officially supported
(setq el-get-packages
      '(
        el-get
        ein
        auto-complete+
        auto-complete-emacs-lisp
        haskell-mode))

;; setup packages out of official el-get repo
(setq el-get-sources
      '(
        (:name firecode-theme
               :type elpa)
        (:name better-defaults
               :type elpa)))

;; merge all packages from different sources
(setq el-get-packages
      (append el-get-packages
;              (mapcar 'el-get-as-symbol ;this seems unimportant?
                      (mapcar 'el-get-source-name el-get-sources)))
(el-get 'sync el-get-packages)

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; some other init settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;
(desktop-save-mode 1)
;; set this variable to enable auto refresh of buffers like dired-mode buffer
(setq global-auto-revert-non-file-buffers t)
;; setup auto refresh of files and buffers when contents of them changed
(global-auto-revert-mode 1)
(split-window-horizontally)
(xterm-mouse-mode)

(defun after-init-hook-func ()
    (load-theme 'firecode t))
(add-hook 'after-init-hook 'after-init-hook-func)
