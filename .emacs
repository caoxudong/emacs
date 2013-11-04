(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(make-backup-files nil)
 '(org-agenda-files nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq default-directory "~" )

;;load packages in site-lisp
(let ((default-directory "/usr/share/emacs/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))


;;show line number and column number
(global-linum-mode t)
(column-number-mode t)


;;auto-complete
(global-set-key [(meta ?/)] 'hippie-expand)


;;hide tool bar
;;(tool-bar-mode nil)


;;show () [] {} pair
(show-paren-mode t)

;;color theme
(add-to-list 'load-path "~/workspace/repositories/emacs/plugins/color-theme")
(require 'color-theme)
(color-theme-initialize)
(color-theme-darksorrow)


;;enable ibuffer
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)


;;set utf-8 charset
(setq current-language-environment "UTF-8") 
(setq default-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)


;;start ido-mode, another buffer manager
(ido-mode t)

(put 'dired-find-alternate-file 'disabled nil)

;;change 'yes' and 'no' to 'y' and 'n'
(fset 'yes-or-no-p 'y-or-n-p)


;;add markdown mode
(autoload 'markdown-mode "~/workspace/repositories/emacs/plugins/markdown/markdown-mode.el" "Major mode for editing Markdown files" t) 
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))


;;org settings
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock)
(add-hook 'org-mode-hook 
    (lambda () (setq truncate-lines nil)))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
;;set timestamp when TODO changed to CLOSED
(setq org-log-done 'time)
;;add global agenda files
(setq org-agenda-files (list"~/doc/company/org/info.org"))
;;set not convert sub superscripts
(setq org-export-with-sub-superscripts '{})
;;add costumized status
(setq org-todo-keywords '((type "TODO" "DOING" "SUSPENDED" "|" "DONE" "CANCELED")))


;;set cscope
(setq exec-path (cons "/usr/local/bin" exec-path))  
(add-to-list 'load-path "/usr/share/emacs/site-lisp/")
(require 'xcscope)
(setq cscope-do-not-update-database t)

