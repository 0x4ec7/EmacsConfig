(setq user-full-name "仇之东")
(setq user-mail-address "0x4ec7@gmail.com")


(defalias 'yes-or-no-p 'y-or-n-p)


(add-hook 'before-save-hook 'delete-trailing-whitespace)


(global-linum-mode t)
(setq linum-format "%3d ")
(setq column-number-mode t)


(menu-bar-mode -1)


(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
;; (add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
;; Ensures that any currently installed packages will be initialized and any required packages will be installed.
(el-get 'sync)


(require 'ido)
(ido-mode)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("07dda9a3249f9ac909e7e0dc3c8876fd45898aa21646e093148dbd6ebb294f66" "e97dbbb2b1c42b8588e16523824bc0cb3a21b91eefd6502879cf5baa1fa32e10" "2305decca2d6ea63a408edd4701edf5f4f5e19312114c9d1e1d5ffe3112cde58" "d9046dcd38624dbe0eb84605e77d165e24fdfca3a40c3b13f504728bab0bf99d" default)))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/"))))
 '(python-environment-virtualenv
   (quote
    ("virtualenv" "--quiet" "--python" "/usr/local/bin/python3"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(require 'package)
(add-to-list 'package-archives
	     '("elpy" . "https://jorgenschaefer.github.io/packages/"))
(package-initialize)
(elpy-enable)
(elpy-use-ipython)


(add-to-list 'load-path
	     "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)


;; (add-to-list 'load-path "~/.emacs.d/el-get/jedi")
;; (require 'jedi)
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:complete-on-dot t)


;; (require 'company)
;; (add-hook 'after-init-hook 'global-company-mode)


(require 'undo-tree)
(global-undo-tree-mode)


(add-to-list 'custom-theme-load-path "~/.emacs.d/el-get/color-theme/themes/")
(require 'color-theme)
;; (set-face-attribute 'default nil :background "#000" :foreground "#DDD")
(load-theme 'material t)


(add-to-list 'load-path "~/.emacs.d/el-get/multiple-cursors")
(require 'multiple-cursors)


(require 'smartparens-config)
(add-hook 'python-mode-hook 'smartparens-mode)


(require 'projectile)
(projectile-global-mode)
(add-hook 'python-mode-hook 'projectile-mode)
(setq projectile-completion-system 'grizzl)


(require 'smex)
(smex-initialize)


(require 'window-numbering)
(window-numbering-mode t)


(require 'neotree)
(setq neo-smart-open t)


(require 'whitespace)
(setq whitespace-line-column 79)
(setq whitespace-style '(face lines-tail))
(add-hook 'python-mode-hook 'whitespace-mode)


;; (require 'git-gutter)
;; (global-git-gutter-mode +1)


(add-to-list 'load-path "~/.emacs.d/plugins/")
(require 'geeknote)
(setq geeknote-command "python /usr/local/lib/python2.7/site-packages/geeknote-0.2a0-py2.7.egg/geeknote/geeknote.py")

;; (add-to-list 'load-path "~/.emacs.d/plugins/")
;; (require 'python-django)


(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
	(setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))


(defun neotree-ffip-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (ffip-project-root))
	(file-name (buffer-file-name)))
    (if project-dir
	(progn
	  (neotree-dir project-dir)
	  (neotree-find file-name))
      (message "Could not find git project root."))))


(require 'bind-key)
(bind-key* "M-x" 'smex)
(bind-key* "C-_" 'comment-or-uncomment-region-or-line)
(bind-key* "C-c C-e" 'mc/edit-lines)
(bind-key* "C-c C-n" 'mc/mark-next-like-this)
(bind-key* "C-c C-p" 'mc/mark-previous-like-this)
(bind-key* "C-c C-a" 'mc/mark-all-like-this)
(bind-key* "C-c C-s" 'mc/mark-all-symbols-like-this)
(bind-key* "C-z" 'undo-tree-undo)
(bind-key* "C-x u" 'undo-tree-visualize)
(bind-key* "C-k" 'kill-whole-line)
(bind-key* "C-x C-f" 'projectile-find-file)
(bind-key* "C-x 2" (lambda () (interactive)(split-window-below)(other-window 1)))
(bind-key* "C-x 3" (lambda () (interactive)(split-window-right)(other-window 1)))
(bind-key* "C-j" (lambda () (interactive)(end-of-line)(newline-and-indent)))
(bind-key* "C-x <up>" 'windove-up)
(bind-key* "C-x <down>" 'windmove-down)
(bind-key* "C-x <right>" 'windmove-right)
(bind-key* "C-x <left>" 'windmove-left)
(bind-key* "C-c t" 'neotree-toggle)
(bind-key* "C-c p" 'neotree-ffip-project-dir)
(bind-key* "C-c g c" 'geeknote-create)
(bind-key* "C-c g e" 'geeknote-edit)
(bind-key* "C-c g f" 'geeknote-find)
(bind-key* "C-c g s" 'geeknote-show)
(bind-key* "C-c g r" 'geeknote-remove)
(bind-key* "C-c g m" 'geeknote-move)
