;;隐藏工具栏
(tool-bar-mode -1)
;;隐藏菜单栏
(menu-bar-mode -1)
;;显示行号
(global-linum-mode 1)
(scroll-bar-mode -1)
;;全屏
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))
;; auto insert closing bracket
(electric-pair-mode 1)
;;关闭启动帮助文档
(setq inhibit-splash-screen 1)
;; make cursor movement stop in between camelCase words.
(global-subword-mode 1)
;; make typing delete/overwrites selected text
(delete-selection-mode 1)
;; turn on highlighting current line
(global-hl-line-mode 1)
;; UTF-8 as default encoding
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
;; turn on bracket match highlight
(show-paren-mode 1)
;;column number position within line
(column-number-mode 1)
;; set font for all windows. keep window size fixed
(set-frame-font "Roboto Mono-9" t t)
;; stop creating those backup~ files
(setq make-backup-files nil)
;; stop creating those #auto-save# files
(setq auto-save-default nil)
;; when a file is updated outside emacs, make it update if it's already opened in emacs
(global-auto-revert-mode 1)
(setq line-move-visual t)
(global-visual-line-mode 1)
(defalias 'yes-or-no-p 'y-or-n-p)
(progn
  ;; stop warning prompt for some commands. There's always undo.
  (put 'narrow-to-region 'disabled nil)
  (put 'narrow-to-page 'disabled nil)
  (put 'upcase-region 'disabled nil)
  (put 'downcase-region 'disabled nil)
  (put 'erase-buffer 'disabled nil)
  (put 'scroll-left 'disabled nil)
  (put 'dired-find-alternate-file 'disabled nil)
  )
;;org mode 配置
(setq org-latex-pdf-process '("xelatex -interaction nonstopmode %f"
                              "xelatex -interaction nonstopmode %f"))

;; ;; 禁用htmlize
;; (setq org-html-htmlize-output-type nil)

;; ;;修改 org-html-src-block
;; (define-advice org-html-src-block (:override (src-block _contents info) pygmentize)
;;   "Highlight src-block via Pygmentize."
;;   (let ((lang (org-element-property :language src-block))
;;         (code (org-html-format-code src-block info)))
;;     (with-temp-buffer
;;       (call-process-region code nil "pygmentize" nil t nil "-l" lang "-f" "html")
;;       (buffer-string))))

;;除了error提示之外,其他的warning不提示
(setq warning-minimum-level :emergency)
