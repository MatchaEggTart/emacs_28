;;; init-develop.el --- the configurations for devloper
;;; Commentary:
;;; Code:

;; -*- lexical-binding: t -*-

;; editorconfig
(use-package editorconfig
	;; :ensure t
	:config
	;; Enable editorconfig-mode (EditorConfig homepage: https://editorconfig.org/)
	(editorconfig-mode t))

;; 自动补全(新)
(use-package company
  :hook (after-init . global-company-mode)
  :config
  (setq
   company-minimum-prefix-length 1
   ;; 补全时间等待
   company-idle-delay 0
   company-show-quick-access t)
  :bind (:map company-active-map
	      ("C-n" . 'company-select-next)
	      ("C-p" . 'company-select-previous)))

;; for org-bars
(use-package company-posframe
  :config
  (company-posframe-mode 1)
  ;; (setq company-tooltip-minimum-width 40)
  )

;; 高亮括号
(use-package highlight-parentheses
  :hook (prog-mode . highlight-parentheses-mode))

(provide 'init-develop)

;;; init-develop.el ends here
