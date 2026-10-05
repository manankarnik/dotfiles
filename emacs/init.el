;;; General / Startup
(setq inhibit-startup-screen t)
(setq read-answer-short t)
(setq use-short-answers t)
(setq make-backup-files nil)
(setq warning-minimum-level :error)
(setq custom-file "~/.config/emacs/emacs-custom.el")
(load custom-file 'noerror)

;;; UI & Appearance
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

(column-number-mode 1)
(display-time-mode 1)
(global-display-line-numbers-mode 1)

(setq display-line-numbers-type 'relative)
(set-face-attribute 'default nil :font "Iosevka Nerd Font Mono" :height 150)

(set-frame-parameter nil 'alpha-background 90)

;;; Editing & Indentation
(delete-selection-mode 1)
(show-paren-mode 1)

(setq-default c-basic-offset 4)
(setq-default c-ts-mode-indent-offset 4)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;;; Minibuffer & History
(fido-mode 1)
(savehist-mode 1)

;;; Compilation
(setq compilation-scroll-output t)
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)

;;; Eglot
;; (add-hook 'prog-mode-hook 'eglot-ensure)

;; Latex
(defun my/latex-compile-on-save ()
  "Silently compile LaTeX file on save using pdflatex with -shell-escape."
  (when (and (buffer-file-name)
             (memq major-mode '(latex-mode LaTeX-mode)))
    (start-process-shell-command
     "pdflatex-on-save"
     nil
     (concat "pdflatex -shell-escape -interaction=nonstopmode " 
             (shell-quote-argument (buffer-file-name))))))

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (add-hook 'after-save-hook #'my/latex-compile-on-save nil t)))

(add-hook 'latex-mode-hook
          (lambda ()
            (add-hook 'after-save-hook #'my/latex-compile-on-save nil t)))

;;; Package Management
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(require 'use-package)
(setq use-package-always-ensure t)

;;; Packages
(use-package magit)

(use-package doom-themes
  :config (load-theme 'doom-gruvbox :no-confirm))


(use-package which-key
  :config (which-key-mode 1))

(use-package treesit-auto
  :custom
  (treesit-auto-install t)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0)
  (corfu-auto-prefix 1)
  :config
  (global-corfu-mode 1)
  (corfu-popupinfo-mode 1))
