; C-c ' 修改emacs-lisp 区域内的代码

(setq inhibit-startup-message t)
(tool-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "<f5>") 'revert-buffer)
; 高亮所在行
(global-hl-line-mode t)

; 
(setq save-interprogram-paste-before-kill t)
(global-auto-revert-mode 1)
(setq auto-revert-verbose nil)
(global-set-key (kbd "<f5>") 'revert-buffer)

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config 
  (which-key-mode))

;; buffer switch: C-x b 
(setq indo-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
;; buffer 列表
(defalias 'list-buffers 'ibuffer)


;; 窗口跳转
;; M-o 1
(use-package ace-window
  :bind ("M-o" . ace-window)
  :ensure t
  :init
  (progn
   ;; (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0)))))
    ))

;; it looks like counsel is a requirement for swiper
(use-package counsel
  :ensure t)

(use-package ivy 
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-display-style 'fancy))

;; 搜索: swiper
(use-package swiper
  :ensure try
  :bind (("C-s" . swiper)
	 ("C-r" . swiper)
	 ("C-c C-r" . ivy-resume)
	 ("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
    ))

(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char))

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

(use-package zenburn-theme
  :ensure t
  :config (load-theme 'zenburn t)
  )

(load-theme 'leuven t)

(use-package ox-reveal
:ensure ox-reveal)

(setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")
(setq org-reveal-mathjax t)

(use-package flycheck
:ensure t
:init 
(global-flycheck-mode t))

(use-package jedi 
  :ensure t
  :init 
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-hook 'python-mode-hook 'jedi:ac-setup)) 


(use-package elpy
  :ensure t 
  :config 
  (elpy-enable))

(use-package virtualenvwrapper
  :ensure t
  :config
  (venv-initialize-interactive-shells)
  (venv-initialize-eshell))

(use-package yasnippet
:ensure t
:init 
(progn
(yas-global-mode 1)))

(use-package undo-tree
:ensure t
:init
(global-undo-tree-mode))

(use-package beacon
:ensure t 
:config 
(beacon-mode 1)
;(setq beacon-color "#666600")
)

(use-package hungry-delete
:ensure t
:config 
(global-hungry-delete-mode))

; 选择一个范围里的内容
(use-package expand-region
:ensure t 
:config 
(global-set-key (kbd "C-=") 'er/expand-region))

(use-package iedit
:ensure t)

; 选中一个范围的内容，并拿出去添加修改
; C-x n 
(defun narrow-or-widen-dwim (p)
  "Widen if buffer is narrowed, narrow-dwim otherwise.
  Dwim means: region, org-src-block, org-subtree, or defun,
  whichever applies first. Narrowing to org-src-block actually
  calls `org-edit-src-code'.

  With prefix P, don't widen, just narrow even if buffer is
  already narrowed."
  (interactive "P")
  (declare (interactive-only))
  (cond ((and (not p) (buffer-narrowed-p))(widen))
        ((region-active-p)
         (narrow-to-region (region-beginning) (region-end)))
        ((derived-mode-p 'org-mode)
         (cond ((ignore-errors (org-edit-src-code))
	 (delete-other-windows))
	 ((org-at-block-p)
	 (org-narrow-to-block))
	 (t (org-narrow-to-subtree))))
	 (t (narrow-to-defun))))
	 
	 (define-key ctl-x-map "n" #'narrow-or-widen-dwim)

(defun load-if-exists (f)
  "检测文件是否存在"
  (if (file-readable-p f)
      (load-file f)))

(load-if-exists "something.el")

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (setq web-mode-engines-alist 
	'(("django" . "\\.html\\'")))
  (setq web-mode-ac-sources-alist
	'(("css" . (ac-source-css-property))
	   ("html". (ac-source-words-in-buffer ac-source-abbrev))))
   (setq web-mode-enable-auto-closing t))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(custom-set-variables
 '(org-directory "~/Dropbox/orgfiles")
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-export-html-postamble nil)
 '(org-hide-leading-stars t)
 '(org-startup-folded (quote overview))
 '(org-startup-indented t))

;(setq org-file-apps
;      (append '(
;                ("\\.pdf'\\" . evince %s)
                                        ;                ("\\.x?html?\\'" . "/usr/bin/firefox %s")
                                        ;               ) org-file-apps ))

(global-set-key "\C-ca" 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(use-package better-shell
  :ensure t
  :bind
  (("C-'" . better-shell-shell) ;open shell 
   ("C-;" . better-shell-remote-open)))

(use-package ggtags
  :ensure t
  :config
  (add-hook 'c-mode-common-hook
            (lambda ()
              (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
                (ggtags-mode 1))))
  )

; 非常不错的包
  (use-package projectile
    :ensure t
    :config
    (projectile-global-mode)
    (setq projectile-completion-system 'ivy))

   ; 用于切换项目
  (use-package counsel-projectile
    :ensure t
    :config
    (counsel-projectile-mode))

(global-set-key (kbd "C-c C-p") 'counsel-projectile-switch-project)


