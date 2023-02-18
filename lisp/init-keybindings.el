;;; init-keybindings.el --- customize key
;;; Commentary:
;;; Code:

;; -*- lexical-binding: t -*-

;; y 和 n 取代 yes 和 no
;; (defalias 'yes-or-no-p 'y-or-n-p)
(fset 'yes-or-no-p 'y-or-n-p)

;; 查询三按键
;; (global-set-key (kbd "C-h C-f") 'view-emacs-FAQ)
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; 打开 init.el 文件
(defun open-init-file()
  (interactive)
  (find-file (concat user-emacs-directory "init.el")))
(global-set-key (kbd "<f5>") 'open-init-file)

;; 打开配置文件目录
(defun open-config-foder()
  (interactive)
  (find-file (concat user-emacs-directory "lisp")))
(global-set-key (kbd "<f6>") 'open-config-foder)

;; 查找项目文件快捷键
(global-set-key (kbd "C-c p f") 'project-find-file)

;; 打开最近文件
;; 显示最近编辑过的文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)
(global-set-key (kbd "<f7>") 'recentf-open-files)


(provide 'init-keybindings)

;;; init-keybindings.el ends here
