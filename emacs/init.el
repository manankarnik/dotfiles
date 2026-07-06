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
(set-face-attribute 'default nil :font "CaskaydiaCove Nerd Font Mono" :height 150)

(set-frame-parameter nil 'alpha-background 80)

;;; Editing & Indentation
(delete-selection-mode 1)
(show-paren-mode 1)

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
(add-hook 'prog-mode-hook 'eglot-ensure)

;;; Package Management
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(require 'use-package)
(setq use-package-always-ensure t)

;;; Packages
(use-package magit)

(use-package catppuccin-theme
  :config (load-theme 'catppuccin :no-confirm))

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
