;;; init-eglot.el --- the configurations for language server
;;; Commentary:
;;; Code:

;; -*- lexical-binding: t -*-

;; Eglot
(use-package eglot
  ;; 自从入了 29，就需要添加下面那句
  :pin gnu-devel
  ;; :hook ((css-mode js-mode web-mode) . eglot-ensure)
  :hook ((js-mode) . eglot-ensure)
  :config
  ;; (setq eglot-autoshutdown t
  ;;       completion-category-overrides '((eglot (styles orderless))))
  ;; npm install -g typescript-language-server typescript
  ;; (add-to-list 'eglot-server-programs '(c-mode . ("clang-query")))
  ;; (advice-add 'eglot-code-action-organize-imports :before #'eglot-format-buffer)
  ;; (add-hook 'eglot-managed-mode-hook (lambda () (add-hook 'before-save-hook #'eglot-format-buffer)))
  ;; sudo npm install -g typescript-language-server typescript
  (add-to-list 'eglot-server-programs '(js-mode "typescript-language-server" "--stdio"))
  )

(use-package consult-eglot :after eglot)

(provide 'init-eglot)

;;; init-eglot.el ends here
