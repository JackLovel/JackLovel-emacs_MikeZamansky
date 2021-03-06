;; window 系统：%HOMEPATH%\AppData\Roaming\.emacs.d
;; linux 系统：~/.emacs.d

(require 'package)
(setq package-enable-at-startup nil)

;; 设置国内源
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			 ("melpa" . "http://elpa.emacs-china.org/melpa/")))
(package-initialize)

(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-confirm-babel-evaluate nil)
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-directory "~/Dropbox/orgfiles")
 '(org-export-html-postamble nil)
 '(org-hide-leading-stars t)
 '(org-src-fontify-natively t)
 '(org-startup-folded (quote overview))
 '(org-startup-indented t)
 '(package-selected-packages
   (quote
    (auctex bufler lsp-java eglot rg elfeed-goodies elfeed openwith eshell-git-prompt fish-completion exec-path-from-shell live-py-mode forge git-gutter-fringe company treemacs yasnippet grip-mode company-lsp all-the-icons-dired all-the-icons-ivy all-the-icons dired-subtree dired-narrow dictionary irony-eldoc company-irony wgrep-ag ag auto-yasnippet org-ac org-pdfview pdf-tools git-timemachine git-gutter wgrep pcre2el dired+ treemacs-magit treemacs-icons-dired treemacs-evil treemacs-persp treemacs-projectile emmet-mode smartparens samrtparents dumb-jump counsel-projectile projectile ggtags better-shell virtualenvwrapper web-mode miniedit iedit ledit expand-region hungry-delete beacon undo-tree elpy jedi flycheck ox-reveal elfeed-org zenburn-theme color-theme auto-complete counsel swiper ace-window tabbar org-bullets which-key try use-package)))
 '(send-mail-function (quote mailclient-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0))))
 '(lsp-ui-doc-background ((t (:background nil))))
 '(lsp-ui-doc-header ((t (:inherit (font-lock-string-face italic))))))

;; font-size: 16pt 
(set-face-attribute 'default nil :height 170)

(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
