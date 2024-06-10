;; this is the start of my config file ;;
(setq inhibit-startup-screen t
      global-display-line-numbers 't
      display-line-numbers-type 'relative
      scroll-step 0)
(setq default-frame-alist '((font . "CaskaydiaMono Nerd Font-18:regular")))
(global-display-line-numbers-mode 'relative)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(show-paren-mode 1)
(column-number-mode 1)
(add-to-list 'default-frame-alist '(alpha-background . 75))
(load "~/.emacs.d/.emacs.rc/rc.el")
(add-to-list 'load-path "~/.emacs.d/.emacs.local/")
(rc/require-theme 'catppuccin)
(load "~/.emacs.d/tarffie/main.el")
