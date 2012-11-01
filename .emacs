(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(make-backup-files nil)
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
;;(setq current-language-environment "UTF-8") 
;;(setq default-input-method "chinese-py")    
;;(setq locale-coding-system 'utf-8)
;;(set-terminal-coding-system 'utf-8)
;;(set-keyboard-coding-system 'utf-8)
;;(set-selection-coding-system 'utf-8)
;;(prefer-coding-system 'utf-8)
(set-language-environment 'Chinese-GB)
(set-keyboard-coding-system 'euc-cn)
(set-clipboard-coding-system 'euc-cn)
(set-terminal-coding-system 'euc-cn)
(set-buffer-file-coding-system 'euc-cn)
(set-selection-coding-system 'euc-cn)
(modify-coding-system-alist 'process "*" 'euc-cn)
(setq default-process-coding-system
    '(euc-cn . euc-cn))
(setq-default pathname-coding-system 'euc-cn)


;;start ido-mode, another buffer manager
(ido-mode t)

(put 'dired-find-alternate-file 'disabled nil)

;;change 'yes' and 'no' to 'y' and 'n'
(fset 'yes-or-no-p 'y-or-n-p)


;;add markdown mode
(autoload 'markdown-mode "E:\\software\\program\\etc\\emacs\\plugins\\markdown\\markdown-mode.el" "Major mode for editing Markdown files" t) 
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))

