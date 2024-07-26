;; typescript and stuff requires some aditional config and I'm using it on a separate file .
(load "~/.emacs.d/tarffie/ts-setup.el")
;; ido
(rc/require 'smex 'ido-completing-read+)
(require 'ido-completing-read+)
(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(global-set-key (kbd "C-c n") (find-file "~/notes/notes.org"))

;; paraedit

;; LSP + Tree-sitter
(rc/require 'lsp-mode) 
(rc/require 'lsp-ui)
(rc/require 'company)
(rc/require 'flycheck)
(rc/require 'lsp-treemacs)

(use-package lsp-mode
 :init
 (setq lsp-keymap-prefix "C-c l")
 :hook (rjsx-mode  . lsp)
 (php-mode . lsp)
 (java-mode . lsp)
 (cc-mode . lsp)
 (c-mode . lsp)
 (rust-mode . lsp)
 (typescript-mode . lsp)
 (javascript-mode . lsp)
 (ocaml-mode . lsp))

(use-package helm-lsp :commands helm-lsp-workspace-symbol)
(use-package lsp-ui :commands lsp-ui-mode)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(rc/require 'tree-sitter)
(rc/require 'tree-sitter-langs)
(global-tree-sitter-mode t)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

(use-package company
  :ensure t
  :init
  (global-company-mode)
  :config
  ;; Additional configuration options, if needed
  )

(setq company-idle-delay 0.2) ;; Adjust the idle delay as needed

(use-package company-dabbrev
  :config
  (add-to-list 'company-backends 'company-dabbrev))

(rc/require 'smartparens)
(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config)
  (smartparens-global-mode 1)
  (setq-default show-smartparens-global-mode 1))

(sp-pair "{" nil :post-handlers '(("||\n[i]" "RET")))
(sp-pair "[" nil :post-handlers '(("||\n[i]" "RET")))
(sp-pair "(" nil :post-handlers '(("||\n[i]" "RET")))

;;; magit
(rc/require 'cl-lib)
(rc/require 'magit)

(setq magit-auto-revert-mode nil)

(global-set-key (kbd "C-c m s") 'magit-status)
(global-set-key (kbd "C-c m l") 'magit-log)

;;; multiple cursors  
(rc/require 'multiple-cursors)


(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

;;; compile on C-c C-c && term 
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-c C-t") 'term)

;;; dired
(require 'dired-x)
(setq dired-omit-files
      (concat dired-omit-files "\\|^\\..+$"))
(setq-default dired-dwim-target t)
(setq dired-listing-switches "-alh")

;;; helm
(rc/require 'helm  'helm-git-grep 'helm-ls-git)
(setq helm-ff-transformer-show-only-basename nil)
(global-set-key (kbd "C-c h t") 'helm-cmd-t)
(global-set-key (kbd "C-c h g g") 'helm-git-grep)
(global-set-key (kbd "C-c h g l") 'helm-ls-git-ls)
(global-set-key (kbd "C-c h f") 'helm-find)
(global-set-key (kbd "C-c h a") 'helm-org-agenda-files-headings)
(global-set-key (kbd "C-c h r") 'helm-recentf)

;;; yasnippet
(rc/require 'yasnippet)
(require 'yasnippet)
(setq yas/triggers-in-field nil)
(setq yas-snippet-dirs '("~/.emacs.snippets/"))
(yas-global-mode 1)

;;; crux 
(rc/require 'crux)
(setq save-abbrevs 'silently)
(setq-default abbrev-mode t)

;;; Move Text
(rc/require 'move-text)
(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)
(global-set-key (kbd "C-a") 'crux-move-beginning-of-line)




