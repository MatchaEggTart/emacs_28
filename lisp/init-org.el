;;; --- the configurations of org-mode
;;; Commentary:
;;; Code:

;; -*- lexical-binding: t -*-

;;; 这个配置一定要配置在 use-package 的初始化之前，否则无法正常安装
;; 已经没必要使用了
;; (assq-delete-all 'org package--builtins)
;; (assq-delete-all 'org package--builtin-versions)

(use-package org
  :ensure t)

(use-package org-contrib
  :pin nongnu
  )

;; TODO
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d!/!)")
	      (sequence "WAITING(w@/!)" "SOMEDAY(S)" "|" "CANCELLED(c@/!)" "MEETING(m)" "PHONE(p)"))))


;; TODO plugins - :LOGBOOK
(require 'org-checklist)
;; need repeat task and properties
(setq org-log-done t)
(setq org-log-into-drawer t)

;; org 日历
;; C-c C-s schedule
;; C-c C-d deadline
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-agenda-files '("~/.config/emacs/gtd.org"))
(setq org-agenda-span 'day)

;; 定义模板，生成模板
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/.config/emacs/gtd.org" "Workspace")
	 "* TODO [#B] %?\n  %i\n %U"
	 :empty-lines 1)))
(global-set-key (kbd "C-c r") 'org-capture)

;; 优先级
(setq org-agenda-custom-commands
      '(("c" "重要且紧急的事"
	 ((tags-todo "+PRIORITY=\"A\"")))
	;; ...other commands here
	))

;; 快捷键 <s TAB 创建代码块
(require 'org-tempo) ; 开启 easy template

;; 禁用左尖括号补全
(setq electric-pair-inhibit-predicate
      `(lambda (c)
	 (if (char-equal c ?\<) t (,electric-pair-inhibit-predicate c))))

(add-hook 'org-mode-hook
	  (lambda ()
	    (setq-local electric-pair-inhibit-predicate
			`(lambda (c)
			   (if (char-equal c ?\<) t (,electric-pair-inhibit-predicate c))))))

;; org-bars
(require 'org-bars)
(add-hook 'org-mode-hook #'org-bars-mode)


(provide 'init-org)
;; init-org.el ends here
