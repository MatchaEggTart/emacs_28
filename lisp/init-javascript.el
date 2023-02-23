;;; init-javascript.el --- the configurations for javascript
;;; Commentary:
;;; Code:

;; -*- lexical-binding: t -*-

(use-package js-mode
  :ensure nil
  :defer t
  :mode
  (("\\.json\\'" . js-mode)
   ("\\.js\\'" . js-jsx-mode))
  :custom
  (js-switch-indent-offset 2)
  (js-indent-level 2)
  (js-jsx-indent-line 2)
  :config
  )

(provide 'init-javascript)
;;; init-javascript.el ends here
