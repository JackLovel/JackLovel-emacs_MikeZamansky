[1mdiff --git a/myinit.org b/myinit.org[m
[1mindex 6f68ce8..6591d2b 100644[m
[1m--- a/myinit.org[m
[1m+++ b/myinit.org[m
[36m@@ -112,7 +112,7 @@[m
   :config (load-theme 'zenburn t)[m
   )[m
 [m
[31m-(load-theme 'adwaita)[m
[32m+[m[32m;;(load-theme 'adwaita)[m
 #+END_SRC[m
 [m
 * reveal.js [m
[36m@@ -156,23 +156,25 @@[m
 #+END_SRC [m
 * python [m
 #+BEGIN_SRC emacs-lisp [m
[31m-;  (use-package jedi [m
[31m-;    :ensure t[m
[31m-;    :init [m
[31m-;    (add-hook 'python-mode-hook 'jedi:setup)[m
[31m-;    (add-hook 'python-mode-hook 'jedi:ac-setup)) [m
[32m+[m[32m  ;  (use-package jedi[m[41m [m
[32m+[m[32m  ;    :ensure t[m
[32m+[m[32m  ;    :init[m[41m [m
[32m+[m[32m  ;    (add-hook 'python-mode-hook 'jedi:setup)[m
[32m+[m[32m  ;    (add-hook 'python-mode-hook 'jedi:ac-setup))[m[41m [m
 [m
 [m
[31m-  (use-package elpy[m
[31m-    :ensure t [m
[31m-    :config [m
[31m-    (elpy-enable))[m
[32m+[m[32m  ;  (use-package elpy[m
[32m+[m[32m  ;    :ensure t[m[41m [m
[32m+[m[32m  ;    :config[m[41m [m
[32m+[m[32m  ;    (elpy-enable))[m
 [m
[31m-  (use-package virtualenvwrapper[m
[31m-    :ensure t[m
[31m-    :config[m
[31m-    (venv-initialize-interactive-shells)[m
[31m-    (venv-initialize-eshell))[m
[32m+[m[32m    (use-package virtualenvwrapper[m
[32m+[m[32m      :ensure t[m
[32m+[m[32m      :config[m
[32m+[m[32m      (venv-initialize-interactive-shells)[m
[32m+[m[32m      (venv-initialize-eshell))[m
[32m+[m
[32m+[m[32m  (setq lsp-python-executable-cmd "python3")[m
 #+END_SRC[m
 * misc packages [m
 #+BEGIN_SRC emacs-lisp [m
