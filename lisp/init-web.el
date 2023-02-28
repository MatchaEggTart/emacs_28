;;; init-web.el --- the configurations for html,css,js,jsx
;;; Commentary:
;;; Code:

;; -*- lexical-binding: t -*-

;; Web-mode
(use-package web-mode
  ;; :ensure t
  :init
  (progn
    ;; 将文件归类到 Web 这个 major mode
    (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.s?css\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.tsx?\\'" . web-mode))
    ;; (add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.xml\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.info\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.module\\'" . web-mode))
    ;; 缩进
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-code-indent-offset 2))
  ;; JSX
  ;; :mode ("/\\(components\\|containers\\|src\\)/.*\\.js[x]?\\'")
  :config
  ;; (setq web-mode-content-types-alist
  ;; '(("jsx" . "/\\(components\\|containers\\|src\\)/.*\\.js[x]?\\'"))
  ;; )
  (setq web-mode-enable-current-element-highlight t)
  )

;; html 快捷键，使用 C+j
(use-package emmet-mode
  :pin melpa
  :hook
  ((web-mode css-mode js-jsx-mode) . emmet-mode)
  :config
  (add-to-list 'emmet-jsx-major-modes 'js-jsx-mode)
  )

(provide 'init-web)

;;; init-web.el ends here
