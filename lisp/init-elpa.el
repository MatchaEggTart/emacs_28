;;; init-elpa.el --- the configurations for install packages
;;; Commentary:
;;; Code:

;; -*- lexical-binding: t -*-

;; add melpa to package-archives
(require 'package)
;; 不检查签名，国内镜像如果正在同步，会导致安装签名失败
(setq package-check-signature nil
      load-prefer-newer t)

(setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ;; ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
			 ("melpa-stable" . "https://stable.melpa.org/packages/")))

(package-initialize) ;; You might already have this line

;;防止反复调用 package-refresh-contents 会影响加载速度
(when (not package-archive-contents)
  (package-refresh-contents))

;; 第一个扩展插件：use-package，用来批量统一管理软件包
;; 除非安装了 use-package，否则安装它
(unless (package-installed-p 'use-package)
  ;; 刷新
  (package-refresh-contents)
  ;; 安装 use-package
  (package-install 'use-package))

(setq use-package-always-ensure t
      use-package-always-defer t
      use-package-always-demand nil
      use-package-expand-minimally t
      use-package-verbose t)

;; 使用 use-package
(require 'use-package)

;; 默认 use-package 安装的插件 自动开启 ensure
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; 默认使用 melpa-stable
(setq use-package-always-pin "melpa-stable")

;; 装完插件的重启工具
(use-package restart-emacs)

;; 将此文件暴露对外调用的接口
(provide 'init-elpa)

;;; init-elpa.el ends here
