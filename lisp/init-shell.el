;;; init-shell.el --- the configurations for shell
;;; Commentary:
;;; Code:

;; -*- lexical-binding: t -*-

;; Settings for exec-path-from-shell
;; fix the PATH environment variable issue
(use-package exec-path-from-shell
  :defer nil
  :when (or (memq window-system '(mac ns x))
            (unless (memq system-type '(windows-nt dos))
              (daemonp)))
  :init (exec-path-from-shell-initialize))

(use-package vterm
  :pin melpa
  )
;; :ensure t
;; :confit (display-line-numbers-mode nil))
;;  )

(provide 'init-shell)

;;; init-shell.el ends here
