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
<li><a href="#sec-2-4-1">2.4.1. <span class="done DONE">DONE</span> Add package source and package management tools</a></li>
<li><a href="#sec-2-4-2">2.4.2. <span class="todo TODO">TODO</span> Add my customized configurations</a></li>
<li><a href="#sec-2-4-3">2.4.3. <span class="done DONE">DONE</span> Look and feel configuration</a></li>
<li><a href="#sec-2-4-4">2.4.4. Using third-package for color theme</a></li>
<li><a href="#sec-2-4-5">2.4.5. Configurations for better using experiences</a></li>
<li><a href="#sec-2-4-6">2.4.6. Utilities function here</a></li>
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

### DONE Add package source and package management tools<a id="sec-2-4-1" name="sec-2-4-1"></a>

Firstly, we have to configure the package repositories, which allow us to download and install third-packages by `(package-install)`, it will be easy and clean.
Also based on Purcell's configuration, emacs will automatically check and download the package, if we use `( (require-package 'fullframe) )`, emacs will automatically find and download package (`fullframe`), and install it.

在Emacs第一次初使化打开时，需要初使化reporitories和自动包安装工具，这里引用了Steve Purcell的 `(require-package)` 来进行包的自动检查和安装，这里用它来自动安装 `(use-package)` ，从而后面再就只使用 `(use-package)` 来进行包的安装和配置相关，以规范加载代码和提升包的加载速度。

    ;; This is the set up for load path
    (package-initialize)
    
    
      (require 'package)
    
      ;;; Standard package repositories
    
      (when (< emacs-major-version 24)
        ;; Mainly for ruby-mode
        (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/")))
    
      ;; We include the org repository for completeness, but don't normally
      ;; use it.
      (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
    
      (when (< emacs-major-version 24)
        (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
    
      ;;; Also use Melpa for most packages
      (add-to-list 'package-archives `("melpa" . ,(if (< emacs-major-version 24)
                                                      "http://melpa.org/packages/"
                                                    "https://melpa.org/packages/")))
    
      ;;; Define the functions for installation of packages
    
      (defun require-package (package &optional min-version no-refresh)
        "Install given PACKAGE, optionally requreing MIN-VERSION. If NO-REFRESH is non-nil, the avaliable package lists will not be re-downlaoded in order to locate PACKAGE."
        (if (package-installed-p package min-version)
            t
          (if (or (assoc package package-archive-contents) no-refresh)
              (if (boundp 'package-selected-package)
                  (package-install package nil)
                (package-install package)
                )
            (progn
              (package-refresh-contents)
              (require-package package min-version t))
            )
          )
        )
    
      (defun maybe-require-package (package &optional min-version no-refresh)
        "Try to install PACKAGE, and return non-nil if successful.
      In the event of failure, return nil and print a warning message.
      Optionally require MIN-VERSION.  If NO-REFRESH is non-nil, the
      available package lists will not be re-downloaded in order to
      locate PACKAGE."
        (condition-case err
            (require-package package min-version no-refresh)
          (error
           (message "Couldn't install package '%s': %S" package err) nil)
          )
        )

Secondly, install `(use-package)`, which can be using for package loading, check detail at: <https://github.com/jwiegley/use-package>

    ;; 初使安装use-package
    
    (defvar use-package-verbose t)
    
    (require-package 'use-package)

### TODO Add my customized configurations<a id="sec-2-4-2" name="sec-2-4-2"></a>

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

### DONE Look and feel configuration<a id="sec-2-4-3" name="sec-2-4-3"></a>

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

### Using third-package for color theme<a id="sec-2-4-4" name="sec-2-4-4"></a>

      ;; Got following from Purcell's emacs configuration
      ;; From https://github.com/purcell/emacs.d
    
      ;;(require-package 'color-theme-sanityinc-solarized)
      ;;(require-package 'color-theme-sanityinc-tomorrow)
    
    (use-package color-theme-sanityinc-solarized
        :defer t
    )
    (use-package color-theme-sanityinc-tomorrow
        :defer t)
      ;;------------------------------------------------------------------------------
      ;; Old-style color theming support (via color-theme.el)
      ;;------------------------------------------------------------------------------
      (defcustom window-system-color-theme 'color-theme-sanityinc-solarized-dark
        "Color theme to use in window-system frames.
      If Emacs' native theme support is available, this setting is
      ignored: use `custom-enabled-themes' instead."
        :type 'symbol)
    
      (defcustom tty-color-theme 'color-theme-terminal
        "Color theme to use in TTY frames.
      If Emacs' native theme support is available, this setting is
      ignored: use `custom-enabled-themes' instead."
        :type 'symbol)
    
      (unless (boundp 'custom-enabled-themes)
        (defun color-theme-terminal ()
          (interactive)
          (color-theme-sanityinc-solarized-dark))
    
        (defun apply-best-color-theme-for-frame-type (frame)
          (with-selected-frame frame
            (funcall (if window-system
                         window-system-color-theme
                       tty-color-theme))))
    
        (defun reapply-color-themes ()
          (interactive)
          (mapcar 'apply-best-color-theme-for-frame-type (frame-list)))
    
        (set-variable 'color-theme-is-global nil)
        (add-hook 'after-make-frame-functions 'apply-best-color-theme-for-frame-type)
        (add-hook 'after-init-hook 'reapply-color-themes)
        (apply-best-color-theme-for-frame-type (selected-frame)))
    
    
      ;;------------------------------------------------------------------------------
      ;; New-style theme support, in which per-frame theming is not possible
      ;;------------------------------------------------------------------------------
    
      ;; If you don't customize it, this is the theme you get.
      (setq-default custom-enabled-themes '(sanityinc-solarized-light))
    
      ;; Ensure that themes will be applied even if they have not been customized
      (defun reapply-themes ()
        "Forcibly load the themes listed in `custom-enabled-themes'."
        (dolist (theme custom-enabled-themes)
          (unless (custom-theme-p theme)
            (load-theme theme)))
        (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))
    
      (add-hook 'after-init-hook 'reapply-themes)
    
    
      ;;------------------------------------------------------------------------------
      ;; Toggle between light and dark
      ;;------------------------------------------------------------------------------
      (defun light ()
        "Activate a light color theme."
        (interactive)
        (color-theme-sanityinc-solarized-light))
    
      (defun dark ()
        "Activate a dark color theme."
        (interactive)
        (color-theme-sanityinc-solarized-dark))

### Configurations for better using experiences<a id="sec-2-4-5" name="sec-2-4-5"></a>

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

### Utilities function here<a id="sec-2-4-6" name="sec-2-4-6"></a>

工具中需要配置一些常用的函数，集中放在这里。

      ;; shorthand for interactive lambdas
      (defmacro λ (&rest body)
        `(lambda ()
           (interactive)
           ,@body))
    
      ;; kill region if active, otherwise kill backward word
    
      (defun kill-region-or-backward-word ()
        (interactive)
        (if (region-active-p)
            (kill-region (region-beginning) (region-end))
          (backward-kill-word 1)))
    
      (defun kill-to-beginning-of-line ()
        (interactive)
        (kill-region (save-excursion (beginning-of-line) (point))
                     (point)))
    
      (defun duplicate-current-line-or-region (arg)
        "Duplicates the current line or region ARG times.
      If there's no region, the current line will be duplicated."
        (interactive "p")
        (if (region-active-p)
            (let ((beg (region-beginning))
                  (end (region-end)))
              (duplicate-region arg beg end)
              (one-shot-keybinding "d" (λ (duplicate-region 1 beg end))))
          (duplicate-current-line arg)
          (one-shot-keybinding "d" 'duplicate-current-line)))
    
      (defun duplicate-region (&optional num start end)
        "Duplicates the region bounded by START and END NUM times.
      If no START and END is provided, the current region-beginning and
      region-end is used."
        (interactive "p")
        (save-excursion
         (let* ((start (or start (region-beginning)))
                (end (or end (region-end)))
                (region (buffer-substring start end)))
           (goto-char end)
           (dotimes (i num)
             (insert region)))))
    
      (defun duplicate-current-line (&optional num)
        "Duplicate the current line NUM times."
        (interactive "p")
        (save-excursion
         (when (eq (point-at-eol) (point-max))
           (goto-char (point-max))
           (newline)
           (forward-char -1))
         (duplicate-region num (point-at-bol) (1+ (point-at-eol)))))
    
      (defun my-find-file-as-root ()
        "Like `find-file, but automatically edit the file with
      root-privileges (using tramp/sudo), if the file is not writable by
      user."
        (interactive)
        (let ((file (read-file-name "Edit as root: ")))
          (unless (file-writable-p file)
            (setq file (concat "/sudo:root@localhost:" file)))
          (find-file file)))
    
    
    
    (defun create-scratch-buffer nil
      "create a new scratch buffer to work in. (could be *scratch* - *scratchX*)"
      (interactive)
      (let ((n 0)
            bufname)
        (while (progn
                 (setq bufname (concat "*scratch"
                                       (if (= n 0) "" (int-to-string n))
                                       "*"))
                 (setq n (1+ n))
                 (get-buffer bufname)))
        (switch-to-buffer (get-buffer-create bufname))
        (emacs-lisp-mode)
        ))
    
    (defun split-window-right-and-move-there-dammit ()
      (interactive)
      (split-window-right)
      (windmove-right))
    
    (defun toggle-window-split ()
      (interactive)
      (if (= (count-windows) 2)
          (let* ((this-win-buffer (window-buffer))
                 (next-win-buffer (window-buffer (next-window)))
                 (this-win-edges (window-edges (selected-window)))
                 (next-win-edges (window-edges (next-window)))
                 (this-win-2nd (not (and (<= (car this-win-edges)
                                             (car next-win-edges))
                                         (<= (cadr this-win-edges)
                                             (cadr next-win-edges)))))
                 (splitter
                  (if (= (car this-win-edges)
                         (car (window-edges (next-window))))
                      'split-window-horizontally
                    'split-window-vertically)))
            (delete-other-windows)
            (let ((first-win (selected-window)))
              (funcall splitter)
              (if this-win-2nd (other-window 1))
              (set-window-buffer (selected-window) this-win-buffer)
              (set-window-buffer (next-window) next-win-buffer)
              (select-window first-win)
              (if this-win-2nd (other-window 1))))))
    
    (defun rotate-windows ()
      "Rotate your windows"
      (interactive)
      (cond ((not (> (count-windows)1))
             (message "You can't rotate a single window!"))
            (t
             (setq i 1)
             (setq numWindows (count-windows))
             (while  (< i numWindows)
               (let* (
                      (w1 (elt (window-list) i))
                      (w2 (elt (window-list) (+ (% i numWindows) 1)))
    
                      (b1 (window-buffer w1))
                      (b2 (window-buffer w2))
    
                      (s1 (window-start w1))
                      (s2 (window-start w2))
                      )
                 (set-window-buffer w1  b2)
                 (set-window-buffer w2 b1)
                 (set-window-start w1 s2)
                 (set-window-start w2 s1)
                 (setq i (1+ i)))))))
    
    
    (defun untabify-buffer ()
      (interactive)
      (untabify (point-min) (point-max)))
    
    (defun indent-buffer ()
      (interactive)
      (indent-region (point-min) (point-max)))
    
    (defun cleanup-buffer ()
      "Perform a bunch of operations on the whitespace content of a buffer.
    Including indent-buffer, which should not be called automatically on save."
      (interactive)
      (untabify-buffer)
      (delete-trailing-whitespace)
      (indent-buffer))
    
    (defun file-name-with-one-directory (file-name)
      (concat (cadr (reverse (split-string file-name "/"))) "/"
              (file-name-nondirectory file-name)))
    
    (require 's)
    
    (defvar user-home-directory (concat (expand-file-name "~") "/"))
    
    (defun shorter-file-name (file-name)
      (s-chop-prefix user-home-directory file-name))
    
    (defun recentf--file-cons (file-name)
      (cons (shorter-file-name file-name) file-name))
    
    (defun recentf-ido-find-file ()
      "Find a recent file using ido."
      (interactive)
      (let* ((recent-files (mapcar 'recentf--file-cons recentf-list))
             (files (mapcar 'car recent-files))
             (file (completing-read "Choose recent file: " files)))
        (find-file (cdr (assoc file recent-files)))))