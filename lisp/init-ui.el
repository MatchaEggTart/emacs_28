;;; init-ui.el --- the configurations for ui
;;; Commentary:
;;; Code:

;; -*- lexical-binding: t -*-

(use-package emacs
  :ensure nil
  :config
  (progn
    ;; 关闭启动界面
    (setq inhibit-startup-screen t)
    ;; 自动最大化
    (toggle-frame-maximized)
    ;; 菜单栏关闭
    (menu-bar-mode 0)
    ;; 工具栏关闭
    (tool-bar-mode 0)
    ;; 滚动条关闭
    (scroll-bar-mode 0)
    ;; 显示行号
    (add-hook 'prog-mode-hook #'display-line-numbers-mode t)
    (add-hook 'text-mode-hook #'display-line-numbers-mode t)
    ;; 高亮当前行
    (add-hook 'prog-mode-hook #'hl-line-mode t)
    (add-hook 'text-mode-hook #'hl-line-mode t)
    ;; 光标线状还是块状
    (setq-default cursor-type 'bar)
    )
  )
;; Setting English Font
(set-face-attribute 'default nil :font (font-spec :family "Source Code Pro" :size 14))
;; Setting Chinese Font
(set-fontset-font t 'han (font-spec :family "霞鹜文楷" :weight 'bold))

(use-package projectile
  :config
  (projectile-mode +1)  
  )

;; 启动
(use-package dashboard
  ;; :ensure t
  :init
  (dashboard-setup-startup-hook)
  :config
  ;; (setq dashboard-banner-logo-title "Welcome to Emacs!") ;; 个性签名，随读者喜好设置
  (setq dashboard-center-content t)
  (setq dashboard-projects-backend 'projectile) ;; 读者可以暂时注释掉这一行，等安装了 projectile 后再使用
  (setq dashboard-startup-banner 'official) ;; 也可以自定义图片
  (setq dashboard-items '((recents  . 5)   ;; 显示多少个最近文件
			  ;; (bookmarks . 5)  ;; 显示多少个最近书签
			  (projects . 10))) ;; 显示多少个最近项目
  )


;; 安装主题
(use-package modus-themes
  ;; :init (load-theme 'modus-operandi :no-confim))
  :init (load-theme 'modus-operandi-tinted :no-confim))
  ;; :init (load-theme 'modus-operandi-deuteranopia :no-confim))
  ;; :init (load-theme 'modus-vivendi :co-confim))
  ;; :init (load-theme 'modus-vivendi-tinted :no-confim))
  ;; :init (load-theme 'modus-vivendi-deuteranopia :no-confim))


;; 代码更多颜色
(use-package color-identifiers-mode
  :commands (color-identifiers-mode
             global-color-identifiers-mode
             color-identifiers:refresh)
  :init
  (setq color-identifiers:num-colors 10)
  :hook (prog-mode . color-identifiers-mode)
  )

;; mode-line 显示 文件大小
(use-package simple
  :ensure nil
  :hook (after-init . size-indication-mode)
  :init
  (progn
    (setq column-number-mode t)
    ))

;; 显示按键指令
(use-package keycast
  :after doom-modeline
  :commands keycast-mode
  :custom
  ;; (keycast-mode-line-format "%k%c")
  (keycast-mode-line-format "%k")
  :config
  (define-minor-mode keycast-mode
    "Show current command and its key binding in the mode line."
    :global t
    (if keycast-mode
        (progn
          (add-hook 'pre-command-hook 'keycast--update t)
          (add-to-list 'global-mode-string '("" keycast-mode-line " ")))
      (remove-hook 'pre-command-hook 'keycast--update)
      (setq global-mode-string (remove '("" keycast-mode-line " ") global-mode-string))))
  :hook
  (after-init . keycast-mode)
  )

;; M-x all-the-icons-install-fonts
(use-package all-the-icons
  :if
  (display-graphic-p)
  )


;; 这里的执行顺序非常重要，doom-modeline-mode 的激活时机一定要在设置global-mode-string 之后
(use-package doom-modeline
  :init
  (doom-modeline-mode t)
  ;; (setq
  ;; doom-modeline-minor-modes t
  ;; doom-modeline-icon nil)"
  ;; fix doom modeline for org
  ;; 设置 mode-line 高度
  ;;   :custom-face
  ;;   (mode-line ((t (:height 0.9))))
  ;;   (mode-line-inactive ((t (:height 0.9))))
  )

;; 记住指令跟文件，下次使用优先，不过 28好像默认开启了
(use-package savehist
  :ensure nil
  :hook (after-init . savehist-mode)
  :init (setq enable-recursive-minibuffers t ; Allow commands in minibuffers
	      history-length 1000
	      savehist-additional-variables '(mark-ring
					      global-mark-ring
					      search-ring
					      regexp-search-ring
					      extended-command-history)
	      savehist-autosave-interval 300)
  )

;; 记住 buffer 光标位置
(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))

(provide 'init-ui)
;;; init-ui.el ends here
