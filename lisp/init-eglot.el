;;; init-eglot.el --- the configurations for language server
;;; Commentary:
;;; Code:

;; -*- lexical-binding: t -*-

;; Eglot
(use-package eglot
  ;; :hook ((css-mode js-mode web-mode) . eglot-ensure)
  :config
  ;; (setq eglot-autoshutdown t
  ;;       completion-category-overrides '((eglot (styles orderless))))
  ;; npm install -g typescript-language-server typescript
  (add-to-list 'eglot-server-programs '(web-mode "typescript-language-server" "--stdio"))
  ;; (add-to-list 'eglot-server-programs '(c-mode . ("clang-query")))
  ;; (advice-add 'eglot-code-action-organize-imports :before #'eglot-format-buffer)
  ;; (add-hook 'eglot-managed-mode-hook (lambda () (add-hook 'before-save-hook #'eglot-format-buffer)))
  )

(use-package consult-eglot :after eglot)

(provide 'init-eglot)

;;; init-eglot.el ends here
