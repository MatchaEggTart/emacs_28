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
  ;; 教程 https://www.5axxw.com/wiki/content/aqagqc
  :bind
  ("<f8>" . vterm)
  ;; vterm-copy-mode，默认使用 C-c C-t
  )
;; :ensure t
;; :confit (display-line-numbers-mode nil))
;;  )

(use-package vterm-toggle
  :after vterm
  :pin melpa
  :bind
  (("<f9>" . vterm-toggle)
   ("C-<f9>" . 'vterm-toggle-cd)
   ;;   :map vterm-mode-map
   ;;   ("<C-return>" . vterm-toggle-insert-cd)
   ;;   ("s-n" . vterm-toggle-forward)
   ;;   ("s-p" . vterm-toggle-backward)
   ))

(provide 'init-shell)

;;; init-shell.el ends here
