;; window 系统：%HOMEPATH%\AppData\Roaming\.emacs.d
;; linux 系统：~/.emacs.d

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))
			
(package-initialize)

(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-directory "~/Dropbox/orgfiles")
 '(org-export-html-postamble nil)
 '(org-hide-leading-stars t)
 '(org-startup-folded (quote overview))
 '(org-startup-indented t)
 '(package-selected-packages
   (quote
    (git-timemachine git-gutter wgrep pcre2el dired+ treemacs-magit treemacs-icons-dired treemacs-evil treemacs-persp treemacs-projectile emmet-mode smartparens samrtparents dumb-jump counsel-projectile projectile ggtags better-shell virtualenvwrapper web-mode miniedit iedit ledit expand-region hungry-delete beacon undo-tree elpy jedi flycheck ox-reveal elfeed-org zenburn-theme color-theme auto-complete counsel swiper ace-window tabbar org-bullets which-key try use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))

;; font-size: 16pt 
(set-face-attribute 'default nil :height 170)

(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
