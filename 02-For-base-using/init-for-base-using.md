<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. 说明</a></li>
<li><a href="#sec-2">2. 配置</a>
<ul>
<li><a href="#sec-2-1">2.1. Debug configuration</a></li>
<li><a href="#sec-2-2">2.2. <span class="done DONE">DONE</span> Personal information</a></li>
<li><a href="#sec-2-3">2.3. <span class="done DONE">DONE</span> Changing key-mapping for osx</a></li>
<li><a href="#sec-2-4">2.4. Emacs initialization</a>
<ul>
<li><a href="#sec-2-4-1">2.4.1. <span class="todo TODO">TODO</span> Add my customized configurations</a></li>
<li><a href="#sec-2-4-2">2.4.2. <span class="done DONE">DONE</span> Look and feel configuration</a></li>
<li><a href="#sec-2-4-3">2.4.3. Configurations for better using experiences</a></li>
</ul>
</li>
</ul>
</li>
</ul>
</div>
</div>


# 说明<a id="sec-1" name="sec-1"></a>

Emacs基础配置，包含了对Emacs基础功能的配置内容，及基础配置的调整后的操作介绍说明。

# 配置<a id="sec-2" name="sec-2"></a>

## Debug configuration<a id="sec-2-1" name="sec-2-1"></a>

    ;; mark the start time
    (defconst emacs-start-time (current-time))

## DONE Personal information<a id="sec-2-2" name="sec-2-2"></a>

-   State "DONE"       from ""           <span class="timestamp-wrapper"><span class="timestamp">[2016-06-05 Sun 00:44]</span></span>

    (setq user-full-name "Lu Jianmei"
          user-mail-address "lu.jianmei@trs.com.cn"
    )

## DONE Changing key-mapping for osx<a id="sec-2-3" name="sec-2-3"></a>

-   State "DONE"       from "DONE"       <span class="timestamp-wrapper"><span class="timestamp">[2016-06-05 Sun 00:44]</span></span>

Following is for changing the default key mapping on macbook pro. Which means i change the `(command key)` for  `(meta key)`,  `(option key)` key for  `(control key)`.
Also change the mouse wheel direction to suit macbook pro.
下面部分是基于macbook系统的键盘调整修改配置。

    (defconst *is-a-mac* (eq system-type 'darwin))
    
    (when *is-a-mac*
      (setq mac-command-modifier 'meta)
      (setq mac-option-modifier 'control)
      (setq default-input-method "MacOSX")
      ;; Make mouse wheel / trackpad scrolling less jerky
      (setq mouse-wheel-scroll-amount '(1
                                        ((shift) . 5)
                                        ((control))))
      (dolist (multiple '("" "double-" "triple-"))
        (dolist (direction '("right" "left"))
          (global-set-key (read-kbd-macro (concat "<" multiple "wheel-" direction ">")) 'ignore)))
      (global-set-key (kbd "M-`") 'ns-next-frame)
      (global-set-key (kbd "M-h") 'ns-do-hide-emacs)
      (global-set-key (kbd "M-˙") 'ns-do-hide-others)
      (global-set-key (kbd "M-ˍ") 'ns-do-hide-others) ;; what describe-key reports for cmd-option-h
      )

## Emacs initialization<a id="sec-2-4" name="sec-2-4"></a>

### TODO Add my customized configurations<a id="sec-2-4-1" name="sec-2-4-1"></a>

    (setq package-enable-at-startup nil)
    
    
    ;; Override the pakages default load path, to store some independent configuration
    (add-to-list 'load-path "~/.emacs.d/lisp"
       (message "loading path ~/.emacs.d/lisp")
    )
      (eval-when-compile (require 'cl))
      (defun sanityinc/add-subdirs-to-load-path (parent-dir)
        "Adds every non-hidden subdir of PARENT-DIR to `load-path'."
        (let* ((default-directory parent-dir))
          (progn
            (setq load-path
                  (append
                   (remove-if-not
                    (lambda (dir) (file-directory-p dir))
                    (directory-files (expand-file-name parent-dir) t "^[^\\.]"))
                   load-path)))))
    
      (sanityinc/add-subdirs-to-load-path
       (expand-file-name "site-lisp/" user-emacs-directory))
    
    
    
    (unless (package-installed-p 'use-package)
      (package-install 'use-package))
    (setq use-package-verbose t)
    (setq use-package-always-ensure t)
    (require 'use-package)
    (use-package auto-compile
      :defer t
      :config (auto-compile-on-load-mode))
    (setq load-prefer-newer t)

### DONE Look and feel configuration<a id="sec-2-4-2" name="sec-2-4-2"></a>

Base configurations for window and frame

      ;; hide something
      (menu-bar-mode -1)
      (tool-bar-mode -1)
      (scroll-bar-mode -1)
      (set-default 'cursor-type 'hbar)
      (ido-mode)
    
      (global-hl-line-mode)
      (winner-mode t)
      (windmove-default-keybindings)
    
      ;; load theme
      ;;  (load-theme 'wombat)
    (display-time)
    
    (defvar running-alternate-emacs nil)
    (defvar running-development-emacs nil)

### Configurations for better using experiences<a id="sec-2-4-3" name="sec-2-4-3"></a>

1.  Moving back to previous places

    移动到上一个位置，用于在长文件中进行鼠标的定位。
    
        ;; Handy way of getting back to previous places.
        (bind-key "C-x p" 'pop-to-mark-command)
        (setq set-mark-command-repeat-pop t)

2.  Window move - switching between windows

    一个Frame中打开多个windows后，可以通过增加如下配置，以达到在多个windows中进行跳转；
    当窗口比较多时，可以直接使用 `(C-x o)` 进行快速跳转；
    
        (use-package windmove
          :defer t
          :bind
          (("<f2> <right>" . windmove-right)
           ("<f2> <left>" . windmove-left)
           ("<f2> <up>" . windmove-up)
           ("<f2> <down>" . windmove-down)
           ))
        
        ;; for more window movement
        (use-package switch-window
          :defer t
          :bind (("C-x o" . switch-window)))

3.  Auto Truncate lines

    自动拆行，当一个行过长时，自动折行。
