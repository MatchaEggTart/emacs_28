;;; init-js.el --- the configurations for javascript
;;; Commentary:
;;; Code:

;; -*- lexical-binding: t -*-

(use-package js-mode
  :ensure nil
  :defer t
  :mode
  (("\\.json\\'" . js-mode))
  :custom
  (js-switch-indent-offset 2)
  (js-indent-level 2)
  :config
  )

(provide 'init-js)
;;; init-ui.el ends here
