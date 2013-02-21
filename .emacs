(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(make-backup-files nil)
 '(org-agenda-files (quote ("E:/workspace/company/project/etc/projects.org")))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;show line number and column number
(global-linum-mode t)
(column-number-mode t)


;;auto-complete
(global-set-key [(meta ?/)] 'hippie-expand)


;;hide tool bar
;;(tool-bar-mode nil)


;;color theme
(add-to-list 'load-path "E:\\software\\program\\etc\\emacs\\plugins\\color-theme")
(require 'color-theme)
(color-theme-initialize)
(color-theme-darksorrow)


;;启用ibuffer支持，增强*buffer*
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)


;;设定语言环境为utf-8
(setq current-language-environment "UTF-8") 
(setq default-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)


;;start ido-mode, another buffer manager
(ido-mode t)

(put 'dired-find-alternate-file 'disabled nil)

;;change 'yes' and 'no' to 'y' and 'n'
(fset 'yes-or-no-p 'y-or-n-p)


;;add markdown mode
(autoload 'markdown-mode "E:\\software\\program\\etc\\emacs\\plugins\\markdown\\markdown-mode.el" "Major mode for editing Markdown files" t) 
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))

;;add org-mode
(setq load-path (cons "E:\\software\\program\\etc\\emacs\\plugins\\org\\org-7.9.2\\lisp" load-path))
(setq load-path (cons "E:\\software\\program\\etc\\emacs\\plugins\\org\\org-7.9.2\\contrib\\lisp" load-path))
(require 'org-install)
(require 'org-publish)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock)
(add-hook 'org-mode-hook 
(lambda () (setq truncate-lines nil)))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
;;add org and publish directory
(setq org-publish-project-alist
      '(("org-notes"
         :base-directory "E:\\workspace\\git\\emacs\\org\\org"
         :publishing-directory "E:\\workspace\\git\\emacs\\org\\publish"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
         :auto-index nil
         :index-filename "index.org"
         :index-title "index"
         :link-home "index.html"
         :headline-levels 4
         :section-numbers nil)
        ("org-static"
         :base-directory "E:\\workspace\\git\emacs\\org\\org"
         :publishing-directory "E:\\workspace\\git\\emacs\\org\\publish"
         :recursive t
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
         :publishing-function org-publish-attachment)
        ("org" 
         :components ("org-notes" "org-static")
         :author "caoxudong818@gmail.com"
         )))
;;set timestamp when TODO changed to CLOSED
(setq org-log-done 'time)
;;add global agenda files
(setq org-agenda-files (list "E:/workspace/git/emacs/org/translation.org"
                             "E:/workspace/company/project/etc/projects.org"
                           ))
;;set not convert sub superscripts
(setq org-export-with-sub-superscripts '{})
;;add costumized status
(setq org-todo-keywords '((type "TODO" "DOING" "|" "DONE" "CANCELED")))


;;add git-emacs
(add-to-list 'load-path "e:\\workspace\\git\\git-emacs")
(require 'git-emacs)

;;add cscope
(add-to-list 'load-path "E:\\software\\program\\etc\\emacs\\plugins\\cscope\\cscope-15.8a\\contrib\\xcscope")
(require 'xcscope)

