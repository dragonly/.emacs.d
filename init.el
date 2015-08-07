(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

(desktop-save-mode 1)
(global-auto-revert-mode 1)

(el-get-bundle elpa:better-defaults)
(el-get-bundle ein)
(el-get-bundle auto-complete+)
(el-get-bundle auto-complete-emacs-lisp)
(el-get-bundle elpa:darcula-theme)
(require 'darcula-theme)
