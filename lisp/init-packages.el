(require 'cl)
(when (>= emacs-major-version 24)
  (add-to-list 'package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
				   ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
				   ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
				   ) t)
  )
;;add whatever packages you want here
(defvar snowfog/packages '(
			   company
			   spacemacs-theme
				 hungry-delete
				 swiper
				 counsel
				 smartparens
				 js2-mode
				 org
				 ox-twbs
				 nodejs-repl
				 exec-path-from-shell
				 popwin
				 )  "Default packages")

(setq package-selected-packages snowfog/packages)

(defun snowfog/packages-installed-p ()
  (loop for pkg in snowfog/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (snowfog/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg snowfog/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; let emacs could find the execuable
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


(global-hungry-delete-mode)

;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)


;; config js2-mode for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(global-company-mode t)

(require 'popwin)    ;;when require, wh(setq company-minimum-prefix-length 1)en not require
(popwin-mode t)
(load-theme 'spacemacs-light t)

(provide 'init-packages)
