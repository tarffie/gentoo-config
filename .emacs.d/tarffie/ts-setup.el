(rc/require 'tide)
(rc/require 'prettier-js)
(rc/require 'rjsx-mode)
(rc/require 'web-mode)


(use-package rjsx-mode
  :ensure t
  :mode "\\.js\\'"
  :mode "\\.tsx\\'")

(use-package tide
  :ensure t
  :after (rjsx-mode company flycheck)
  :hook (rjsx-mode . setup-tide-mode))

(defun setup-tide-mode()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier +1)
  (company-mode +1))
(setq company-tooltip-align-annotations t)
(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)

(use-package prettier-js
  :ensure t
  :after (rjsx-mode)
  :hook (rjsx-mode . prettier-js-mode))

(use-package web-mode
  :ensure t
  :after (tide-setup)
  :hook (web-mode . prettier-js-mode))

