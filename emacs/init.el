(setq inhibit-startup-screen t)
(setq read-answer-short t)
(setq use-short-answers t)
(setq backup-by-copying t)
(setq display-line-numbers-type 'relative)
(setq backup-directory-alist '(("." . "~/.config/emacs/saves")))
(setq custom-file "~/.config/emacs/emacs-custom.el")
(setq warning-minimum-level :error)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

(column-number-mode 1)
(display-time-mode 1)
(delete-selection-mode 1)
(fido-mode 1)
(savehist-mode 1)
(show-paren-mode 1)
(global-display-line-numbers-mode 1)

(set-face-attribute 'default nil :font "CaskaydiaCove Nerd Font Mono" :height 150)
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(require 'use-package)
(setq use-package-always-ensure t)

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
