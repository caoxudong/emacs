(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

 (tool-bar-mode nil)
)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;load packages in site-lisp
(add-to-list 'load-path "/usr/share/emacs/site-lisp/")


;;no backup file
(setq make-backup-files nil)


;;set sharing clip 
(setq x-select-enable-clipboard t)


;;Show line number and column number
(global-linum-mode t)
(column-number-mode t)


;;show parentheses
(show-paren-mode 1)


;;auto-complete
(global-set-key [(meta ?/)] 'hippie-expand)


;;set tab
(setq default-tab-width 4)
(setq indent-tabs-mode nil)


;;show () [] {} pair
(show-paren-mode t)

;;color theme
(add-to-list 'load-path "~/workspace/emacs/plugins/color-theme")
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


;;in dired mode, use 'a' key to enter a subdir, without create a new buffer
(put 'dired-find-alternate-file 'disabled nil)


;;change 'yes' and 'no' to 'y' and 'n'
(fset 'yes-or-no-p 'y-or-n-p)


;;add markdown mode
(autoload 'markdown-mode "~/workspace/emacs/plugins/markdown/markdown-mode.el" "Major mode for editing Markdown files" t) 
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
;(setq org-agenda-files (list"~/doc/company/org/tasks.org" "~/doc/company/org/info.org"))
;;set not convert sub superscripts
(setq org-export-with-sub-superscripts '{})
;;add costumized status
(setq org-todo-keywords '((type "TODO" "DOING" "SUSPENDED" "|" "DONE" "CANCELED")))
(setq org-publish-project-alist
      '(("note-org"
         :base-directory "e:\\doc\\org\\org"
         :publishing-directory "e:\\doc\\org\\publish"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
         :auto-index nil
         :index-filename "index.org"
         :index-title "index"
         :link-home "index.html"
         :section-numbers nil
         :author "caoxudong818@gmail.com"
         :style "<link rel=\"stylesheet\"
    href=\"./style/emacs.css\"
    type=\"text/css\"/>")
        ("note-static"
         :base-directory "e:\\doc\\org\\org"
         :publishing-directory "e:\\doc\\org\\publish"
         :recursive t
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
         :author "caoxudong818@gmail.com"
         :publishing-function org-publish-attachment)
        ("note" 
         :components ("note-org" "note-static")
         :author "caoxudong818@gmail.com"
         )))


;;create new scratch by key F10
(defun create-scratch-buffer nil
"Create scratch buffers"             
  (interactive)
  (let ((n 0)
        scratch-buf)
    (while (progn
             (setq scratch-buf (concat "-scratch-"
                                   (if (= n 0) "0" (int-to-string n))
                                   "-"))
             (incf n)
             (get-buffer scratch-buf)))
    (switch-to-buffer (get-buffer-create scratch-buf))
    (text-mode)
    ))
(global-set-key [(f10)] 'create-scratch-buffer)


;;set cscope
(setq exec-path (cons "/usr/local/bin" exec-path))  
(require 'xcscope)
(setq cscope-do-not-update-database t)


;;set for c-mode
(defun my-c-mode-hook ()
  (setq c-basic-offset 4
        indent-tabs-mode t
        default-tab-width 4))
(add-hook 'c-mode-hook 'my-c-mode-hook)
