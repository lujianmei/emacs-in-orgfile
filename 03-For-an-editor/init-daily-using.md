<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Gernal packages configurations</a>
<ul>
<li><a href="#sec-1-1">1.1. Auto complete using company-mode</a></li>
<li><a href="#sec-1-2">1.2. Manage the dash package</a></li>
<li><a href="#sec-1-3">1.3. Config the backups</a></li>
<li><a href="#sec-1-4">1.4. Save files</a></li>
<li><a href="#sec-1-5">1.5. Save history</a></li>
<li><a href="#sec-1-6">1.6. Macros</a>
<ul>
<li><a href="#sec-1-6-1">1.6.1. Key bindings configuration for Macros</a></li>
<li><a href="#sec-1-6-2">1.6.2. Key bindings for Macros</a></li>
</ul>
</li>
<li><a href="#sec-1-7">1.7. Markdown mode</a>
<ul>
<li><a href="#sec-1-7-1">1.7.1. Configuration</a></li>
</ul>
</li>
<li><a href="#sec-1-8">1.8. Tramp</a>
<ul>
<li><a href="#sec-1-8-1">1.8.1. Configuration</a></li>
</ul>
</li>
<li><a href="#sec-1-9">1.9. <span class="done DONE">DONE</span> Winner mode - undo and redo window configuration</a></li>
<li><a href="#sec-1-10">1.10. <span class="done DONE">DONE</span> Mode line format</a></li>
<li><a href="#sec-1-11">1.11. <span class="done DONE">DONE</span> Undo tree</a></li>
<li><a href="#sec-1-12">1.12. <span class="done DONE">DONE</span> Help - guide key</a></li>
<li><a href="#sec-1-13">1.13. <span class="done DONE">DONE</span> Encoding configruation</a></li>
<li><a href="#sec-1-14">1.14. <span class="done DONE">DONE</span> Helm</a>
<ul>
<li><a href="#sec-1-14-1">1.14.1. Configuration</a></li>
</ul>
</li>
<li><a href="#sec-1-15">1.15. <span class="done DONE">DONE</span> Helm-swoop</a></li>
<li><a href="#sec-1-16">1.16. <span class="done DONE">DONE</span> Snippets</a></li>
<li><a href="#sec-1-17">1.17. <span class="done DONE">DONE</span> Edit-list</a></li>
<li><a href="#sec-1-18">1.18. <span class="done DONE">DONE</span> Zap to isearch</a></li>
<li><a href="#sec-1-19">1.19. Chinese-font-setup</a>
<ul>
<li><a href="#sec-1-19-1">1.19.1. Configuration</a></li>
<li><a href="#sec-1-19-2">1.19.2. Shot key binding</a></li>
</ul>
</li>
<li><a href="#sec-1-20">1.20. <span class="todo WAITING">WAITING</span> Smartparens</a>
<ul>
<li><a href="#sec-1-20-1">1.20.1. Configuration</a></li>
</ul>
</li>
<li><a href="#sec-1-21">1.21. Expand-region</a>
<ul>
<li><a href="#sec-1-21-1">1.21.1. Configuration</a></li>
<li><a href="#sec-1-21-2">1.21.2. Key bindings for Expand-region</a></li>
</ul>
</li>
<li><a href="#sec-1-22">1.22. Swap-buffer</a>
<ul>
<li><a href="#sec-1-22-1">1.22.1. Configuration</a></li>
</ul>
</li>
<li><a href="#sec-1-23">1.23. Email Reader - Mu4e</a></li>
<li><a href="#sec-1-24">1.24. Multiple cursors mode</a>
<ul>
<li><a href="#sec-1-24-1">1.24.1. Configuration</a></li>
<li><a href="#sec-1-24-2">1.24.2. Short-key binding</a></li>
</ul>
</li>
<li><a href="#sec-1-25">1.25. Latex mode</a></li>
<li><a href="#sec-1-26">1.26. <span class="todo TODO">TODO</span> Wgrep</a></li>
<li><a href="#sec-1-27">1.27. Tabbar</a>
<ul>
<li><a href="#sec-1-27-1">1.27.1. Configuration</a></li>
<li><a href="#sec-1-27-2">1.27.2. Key binding</a></li>
</ul>
</li>
<li><a href="#sec-1-28">1.28. Perspective</a>
<ul>
<li><a href="#sec-1-28-1">1.28.1. Configuration</a></li>
</ul>
</li>
<li><a href="#sec-1-29">1.29. Ido</a>
<ul>
<li><a href="#sec-1-29-1">1.29.1. Configuration</a></li>
</ul>
</li>
<li><a href="#sec-1-30">1.30. Multiple Major Mode</a>
<ul>
<li><a href="#sec-1-30-1">1.30.1. Configuration</a></li>
</ul>
</li>
</ul>
</li>
</ul>
</div>
</div>


# Gernal packages configurations<a id="sec-1" name="sec-1"></a>

当前分类下，列出支持的包的配置信息。

## Auto complete using company-mode<a id="sec-1-1" name="sec-1-1"></a>

自动完成功能的配置，可以基于它针对不同的语言进行配置自动提示功能；

      ;; Turn on auto complete.
    ;;  (require 'auto-complete-config)       
      ;;(ac-config-default)
    
    (use-package company
      :defer t
      :config (add-hook 'prog-mode-hook 'company-mode))

## Manage the dash package<a id="sec-1-2" name="sec-1-2"></a>

此包用于在macbook上调用dash应用的功能，其它操作系统可以不用；

    (use-package dash
      :defer t)

## Config the backups<a id="sec-1-3" name="sec-1-3"></a>

配置自动备份；

    ;;(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
    (setq backup-directory-alist '(("." . (expand-file-name "backups" user-emacs-directory))))

## Save files<a id="sec-1-4" name="sec-1-4"></a>

Emacs中的自动保存功能，单独存储在另一个文件夹中。

    (setq delete-old-versions -1)
    (setq version-control t)
    (setq vc-make-backup-files t)
    (setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))
    ;;(setq auto-save-file-name-transforms '((".*" (expand-file-name "auto-save-list" user-emacs-directory) t)))

## Save history<a id="sec-1-5" name="sec-1-5"></a>

保存历史记录
From <http://www.wisdomandwonder.com/wordpress/wp-content/uploads/2014/03/C3F.html>

    ;;(setq savehist-file "~/.emacs.d/savehist")
    (setq savehist-file (expand-file-name "savehist" user-emacs-directory))
    (savehist-mode 1)
    (setq history-length t)
    (setq history-delete-duplicates t)
    (setq savehist-save-minibuffer-history 1)
    (setq savehist-additional-variables
          '(kill-ring
            search-ring
            regexp-search-ring))

## Macros<a id="sec-1-6" name="sec-1-6"></a>

### Key bindings configuration for Macros<a id="sec-1-6-1" name="sec-1-6-1"></a>

### Key bindings for Macros<a id="sec-1-6-2" name="sec-1-6-2"></a>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">
<caption class="t-above"><span class="table-number">Table 1:</span> Org-mode快捷键</caption>

<colgroup>
<col  class="left" />

<col  class="left" />

<col  class="left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">宏</th>
<th scope="col" class="left">C-x (</th>
<th scope="col" class="left">开始录制宏</th>
</tr>


<tr>
<th scope="col" class="left">&#xa0;</th>
<th scope="col" class="left">C-x )</th>
<th scope="col" class="left">结束录制宏</th>
</tr>


<tr>
<th scope="col" class="left">&#xa0;</th>
<th scope="col" class="left">C-x e</th>
<th scope="col" class="left">使用宏</th>
</tr>


<tr>
<th scope="col" class="left">&#xa0;</th>
<th scope="col" class="left">C-u</th>
<th scope="col" class="left">重复使用宏，C-u 100 C-x e重复100次</th>
</tr>


<tr>
<th scope="col" class="left">&#xa0;</th>
<th scope="col" class="left">M-x name-last-kbd-macro</th>
<th scope="col" class="left">保存宏，可以在其它地方通过M-x调用此保存好的宏</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>
</tbody>
</table>

## Markdown mode<a id="sec-1-7" name="sec-1-7"></a>

### Configuration<a id="sec-1-7-1" name="sec-1-7-1"></a>

For markdown mode base configuration, please find [Init-markdown-mode](../03-For-an-editor/init-markdown-mode.el).

    ;; load my own markdown mode configuration from init-markdown-mode.el
    ;;(require 'init-markdown-mode)
      (starter-kit-load "03-For-an-editor/init-markdown-mode.org")

## Tramp<a id="sec-1-8" name="sec-1-8"></a>

### Configuration<a id="sec-1-8-1" name="sec-1-8-1"></a>

    ;; setting for tramp
    (setq tramp-default-method "ssh")
    
    ;; config for caching password for 36000s
    (setq password-cache-expiry 36000)

## DONE Winner mode - undo and redo window configuration<a id="sec-1-9" name="sec-1-9"></a>

-   State "DONE"       from ""           <span class="timestamp-wrapper"><span class="timestamp">[2016-05-29 Sun 07:02]</span></span>

`winner-mode` lets you use `C-c <left>` and `C-c <right>` to switch between window configurations. This is handy when something has popped up a buffer that you want to look at briefly before returning to whatever you were working on. When you're done, press `C-c <left>`.

    (use-package winner
      :defer t)

## DONE Mode line format<a id="sec-1-10" name="sec-1-10"></a>

-   State "DONE"       from ""           <span class="timestamp-wrapper"><span class="timestamp">[2016-05-29 Sun 07:02]</span></span>

Display a more compact mode line

    (use-package smart-mode-line
      :defer t)

## DONE Undo tree<a id="sec-1-11" name="sec-1-11"></a>

-   State "DONE"       from ""           <span class="timestamp-wrapper"><span class="timestamp">[2016-05-29 Sun 07:02]</span></span>

Allow us to visually walk through the changes you've made, undo back to a certain point (or redo), and go down different branches.
Shot key binding: `(C-x u)`

    (use-package undo-tree
      :defer t
      :diminish undo-tree-mode
      :config
      (progn
        (global-undo-tree-mode)
        (setq undo-tree-visualizer-timestamps t)
        (setq undo-tree-visualizer-diff t)))

## DONE Help - guide key<a id="sec-1-12" name="sec-1-12"></a>

-   State "DONE"       from ""           <span class="timestamp-wrapper"><span class="timestamp">[2016-05-29 Sun 07:02]</span></span>

This library is very helpful, we can use it to help us remember or find the shot key binding. It will pops up a mini-buffer to show us the shot-key when we typed first part with a shot delay.
`(guide-key)` 包可以帮助我们查看操作的快捷键，对于一些不太常用的快捷键想不起来的时候，可以输入快捷键的前缀后，暂停一下，Emacs即会弹出一个子窗口，列出当前前缀下可以选择的快捷键，及其函数名称。以方便我们进行查找。

    (use-package guide-key
      :defer t
      :diminish guide-key-mode
      :config
      (progn
      (setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-c"))
      (guide-key-mode 1)))  ; Enable guide-key-mode

## DONE Encoding configruation<a id="sec-1-13" name="sec-1-13"></a>

-   State "DONE"       from ""           <span class="timestamp-wrapper"><span class="timestamp">[2016-05-29 Sun 07:03]</span></span>

This configuration from: <http://www.wisdomandwonder.com/wordpress/wp-content/uploads/2014/03/C3F.html>

    (prefer-coding-system 'utf-8)
    (when (display-graphic-p)
      (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))

## DONE Helm<a id="sec-1-14" name="sec-1-14"></a>

-   State "DONE"       from ""           <span class="timestamp-wrapper"><span class="timestamp">[2016-05-29 Sun 07:03]</span></span>

### Configuration<a id="sec-1-14-1" name="sec-1-14-1"></a>

    (use-package helm
      :defer t
      :diminish helm-mode
      :init
      (progn
        (require 'helm-config)
        (setq helm-candidate-number-limit 100)
        ;; From https://gist.github.com/antifuchs/9238468
        (setq helm-idle-delay 0.0 ; update fast sources immediately (doesn't).
              helm-input-idle-delay 0.01  ; this actually updates things
                                            ; reeeelatively quickly.
              helm-yas-display-key-on-candidate t
              helm-quick-update t
              helm-buffers-fuzzy-matching t
              helm-recentf-fuzzy-match t
              helm-buffers-fuzzy-matching t
              helm-M-x-fuzzy-match t
              helm-mode-fuzzy-match t
              helm-completion-in-region-fuzzy-match t
              helm-recentf-fuzzy-match t
              helm-semantic-fuzzy-match t
              helm-imenu-fuzzy-match t
              helm-apropos-fuzzy-match t
              helm-lisp-fuzzy-completion t
              helm-M-x-requires-pattern nil
              helm-autoresize-mode 1 ;; resize the window
              helm-autoresize-max-height 40 ;; make the max height as 40% percent of current frame height
              helm-ff-skip-boring-files t)
        (helm-mode))
      :bind (("C-c h" . helm-mini)
             ("C-x c a" . helm-apropos)
             ("C-x C-b" . helm-buffers-list)
             ("C-x b" . helm-buffers-list)
             ("M-y" . helm-show-kill-ring)         ("M-x" . helm-M-x)
             ("C-x c o" . helm-occur)
             ("C-x c s" . helm-swoop)
             ("C-x c y" . helm-yas-complete)
             ("C-x c Y" . helm-yas-create-snippet-on-region)
             ("C-x c b" .  helm-do-grep-book-notes)
             ("C-x c i" . helm-org-in-buffer-headings)
             ("C-x c SPC" . helm-all-mark-rings)))
    ;(ido-mode -1) ;; Turn off ido mode in case I enabled it accidentally
    
    
    (use-package helm-descbinds
      :defer t
      :bind (("C-x c b" . helm-descbinds)
             ("C-x c w" . helm-descbinds)))
    
    ;; Use helm to browse my notes files
    (defvar book-notes-directory "~/workspace/github/work-notes")
    (defun helm-do-grep-book-notes ()
      "Search my book notes."
      (interactive)
      (helm-do-grep-1 (list book-notes-directory)))

## DONE Helm-swoop<a id="sec-1-15" name="sec-1-15"></a>

-   State "DONE"       from ""           <span class="timestamp-wrapper"><span class="timestamp">[2016-05-29 Sun 07:03]</span></span>

    ;; setting for helm-swoop
    
    ;; https://github.com/ShingoFukuyama/helm-swoop
    (use-package helm-swoop
      :defer t
     :bind
     (("C-S-s" . helm-swoop)
      ("M-i" . helm-swoop)
      ("M-s s" . helm-swoop)
      ("M-s M-s" . helm-swoop)
      ("M-I" . helm-swoop-back-to-last-point)
      ("C-c M-i" . helm-multi-swoop)
      ("C-x M-i" . helm-multi-swoop-all)
      )
     :config
     (progn
    ;; When doing isearch, hand the word over to helm-swoop
       (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
    ;; From helm-swoop to helm-multi-swoop-all
       (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)
    ;; Move up and down like isearch
    (define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
    (define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
    (define-key helm-multi-swoop-map (kbd "C-r") 'helm-previous-line)
    (define-key helm-multi-swoop-map (kbd "C-s") 'helm-next-line)
    
    )
    )
    
    ;; Save buffer when helm-multi-swoop-edit complete
    (setq helm-multi-swoop-edit-save t)
    
    ;; If this value is t, split window inside the current window
    (setq helm-swoop-split-with-multiple-windows nil)
    
    ;; Split direcion. 'split-window-vertically or 'split-window-horizontally
    (setq helm-swoop-split-direction 'split-window-vertically)
    
    ;; If nil, you can slightly boost invoke speed in exchange for text color
    (setq helm-swoop-speed-or-color nil)
    
    ;; ;; Go to the opposite side of line from the end or beginning of line
    (setq helm-swoop-move-to-line-cycle t)
    
    ;; Optional face for line numbers
    ;; Face name is `helm-swoop-line-number-face`
    (setq helm-swoop-use-line-number-face t)

## DONE Snippets<a id="sec-1-16" name="sec-1-16"></a>

-   State "DONE"       from ""           <span class="timestamp-wrapper"><span class="timestamp">[2016-05-29 Sun 07:04]</span></span>

Snippets工具可以让我们使用定义好的代码片断，或者文本块，从而可以通过快捷键的方式快速录入。从而提高录入速度。

    (use-package yasnippet
      :defer t
      :diminish yas-minor-mode
      :init (yas-global-mode)
      :config
      (progn
        (yas-global-mode)
        (add-hook 'hippie-expand-try-functions-list 'yas-hippie-try-expand)
        (setq yas-key-syntaxes '("w_" "w_." "^ "))
        ;;(setq yas-installed-snippets-dir "~/emacs.d-new/yasnippet-snippets")
        (setq yas-installed-snippets-dir (expand-file-name "yasnippet-snippets" user-emacs-directory))
        (setq yas-expand-only-for-last-commands nil)
        (yas-global-mode 1)
        (bind-key "\t" 'hippie-expand yas-minor-mode-map)
        (add-to-list 'yas-prompt-functions 'shk-yas/helm-prompt)))
    
    
    (defun shk-yas/helm-prompt (prompt choices &optional display-fn)
      "Use helm to select a snippet. Put this into `yas/prompt-functions.'"
      (interactive)
      (setq display-fn (or display-fn 'identity))
      (if (require 'helm-config)
          (let (tmpsource cands result rmap)
            (setq cands (mapcar (lambda (x) (funcall display-fn x)) choices))
            (setq rmap (mapcar (lambda (x) (cons (funcall display-fn x) x)) choices))
            (setq tmpsource
                  (list
                   (cons 'name prompt)
                   (cons 'candidates cands)
                   '(action . (("Expand" . (lambda (selection) selection))))
                   ))
            (setq result (helm-other-buffer '(tmpsource) "*helm-select-yasnippet"))
            (if (null result)
                (signal 'quit "user quit!")
              (cdr (assoc result rmap))))
        nil))
    
    
    (setq default-cursor-color "gray")
    (setq yasnippet-can-fire-cursor-color "purple")
    
    ;; It will test whether it can expand, if yes, cursor color -> green.
    (defun yasnippet-can-fire-p (&optional field)
      (interactive)
      (setq yas--condition-cache-timestamp (current-time))
      (let (templates-and-pos)
        (unless (and yas-expand-only-for-last-commands
                     (not (member last-command yas-expand-only-for-last-commands)))
          (setq templates-and-pos (if field
                                      (save-restriction
                                        (narrow-to-region (yas--field-start field)
                                                          (yas--field-end field))
                                        (yas--templates-for-key-at-point))
                                    (yas--templates-for-key-at-point))))
        (and templates-and-pos (first templates-and-pos))))
    
    (defun my/change-cursor-color-when-can-expand (&optional field)
      (interactive)
      (when (eq last-command 'self-insert-command)
        (set-cursor-color (if (my/can-expand)
                              yasnippet-can-fire-cursor-color
                            default-cursor-color))))
    
    (defun my/can-expand ()
      "Return true if right after an expandable thing."
      (or (abbrev--before-point) (yasnippet-can-fire-p)))
    
                                            ; As pointed out by Dmitri, this will make sure it will update color when needed.
    (remove-hook 'post-command-hook 'my/change-cursor-color-when-can-expand)
    
    (defun my/insert-space-or-expand ()
      "For binding to the SPC SPC keychord."
      (interactive)
      (condition-case nil (or (my/hippie-expand-maybe nil) (insert "  "))))
    
    (defun my/hippie-expand-maybe (arg)
      "Try to expand text before point, using multiple methods.
    The expansion functions in `hippie-expand-try-functions-list' are
    tried in order, until a possible expansion is found.  Repeated
    application of `hippie-expand' inserts successively possible
    expansions.
    With a positive numeric argument, jumps directly to the ARG next
    function in this list.  With a negative argument or just \\[universal-argument],
    undoes the expansion."
      (interactive "P")
      (require 'hippie-exp)
      (if (or (not arg)
              (and (integerp arg) (> arg 0)))
          (let ((first (or (= he-num -1)
                           (not (equal this-command last-command)))))
            (if first
                (progn
                  (setq he-num -1)
                  (setq he-tried-table nil)))
            (if arg
                (if (not first) (he-reset-string))
              (setq arg 0))
            (let ((i (max (+ he-num arg) 0)))
              (while (not (or (>= i (length hippie-expand-try-functions-list))
                              (apply (nth i hippie-expand-try-functions-list)
                                     (list (= he-num i)))))
                (setq i (1+ i)))
              (setq he-num i))
            (if (>= he-num (length hippie-expand-try-functions-list))
                (progn (setq he-num -1) nil)
              (if (and hippie-expand-verbose
                       (not (window-minibuffer-p)))
                  (message "Using %s"
                           (nth he-num hippie-expand-try-functions-list)))))
        (if (and (>= he-num 0)
                 (eq (marker-buffer he-string-beg) (current-buffer)))
            (progn
              (setq he-num -1)
              (he-reset-string)
              (if (and hippie-expand-verbose
                       (not (window-minibuffer-p)))
                  (message "Undoing expansions"))))))

## DONE Edit-list<a id="sec-1-17" name="sec-1-17"></a>

-   State "DONE"       from ""           <span class="timestamp-wrapper"><span class="timestamp">[2016-05-29 Sun 07:04]</span></span>

M-x edit-list makes it easier to edit an Emacs Lisp list.
\\#+ombegin\_src emacs-lisp :tangle yes
  (use-package edit-list

:defer t

    :commands edit-list)
\\#+end\_src

## DONE Zap to isearch<a id="sec-1-18" name="sec-1-18"></a>

-   State "DONE"       from ""           <span class="timestamp-wrapper"><span class="timestamp">[2016-05-29 Sun 07:04]</span></span>

From Steve Purcell, who linked to <http://www.emacswiki.org/emacs/ZapToISearch>

    (defun zap-to-isearch (rbeg rend)
      "Kill the region between the mark and the closest portion of
    the isearch match string. The behaviour is meant to be analogous
    to zap-to-char; let's call it zap-to-isearch. The deleted region
    does not include the isearch word. This is meant to be bound only
    in isearch mode.  The point of this function is that oftentimes
    you want to delete some portion of text, one end of which happens
    to be an active isearch word. The observation to make is that if
    you use isearch a lot to move the cursor around (as you should,
    it is much more efficient than using the arrows), it happens a
    lot that you could just delete the active region between the mark
    and the point, not include the isearch word."
      (interactive "r")
      (when (not mark-active)
        (error "Mark is not active"))
      (let* ((isearch-bounds (list isearch-other-end (point)))
             (ismin (apply 'min isearch-bounds))
             (ismax (apply 'max isearch-bounds))
             )
        (if (< (mark) ismin)
            (kill-region (mark) ismin)
          (if (> (mark) ismax)
              (kill-region ismax (mark))
            (error "Internal error in isearch kill function.")))
        (isearch-exit)
        ))
    
    (define-key isearch-mode-map [(meta z)] 'zap-to-isearch)

## Chinese-font-setup<a id="sec-1-19" name="sec-1-19"></a>

在Org-mode中，编辑表格并让表格的分隔线对齐是一件不太容易的事情，主要原因是因为Org-mode中编辑时字母与汉字同时存在时，则字母字体长度与汉字字体宽度不同的原因导致，因此这里的主要解决方案是找到一种通用等宽字体，通过字体的配置来达到最终表格对齐正常。
感谢Chinese-font-setup的包开发者：

### Configuration<a id="sec-1-19-1" name="sec-1-19-1"></a>

    ;; add font-config for chinese double-width fonts issue
    (use-package chinese-fonts-setup
      :config
      (setq cfs-profiles
            '("program" "org-mode" "read-book"))
    )

### Shot key binding<a id="sec-1-19-2" name="sec-1-19-2"></a>

    ;; Reset Increase Font size and Descrease Font size short key binding after using chinese-font-setup plugin
    ;; Reference: https://github.com/tumashu/chinese-fonts-setup
    (global-unset-key (kbd "C-x C-=")) ;; remove original font-resize
    (global-set-key (kbd "C-x C-=") 'cfs-increase-fontsize)
    (global-set-key (kbd "C-x M-=") 'cfs-decrease-fontsize)

## WAITING Smartparens     :WAITING:<a id="sec-1-20" name="sec-1-20"></a>

-   State "WAITING"    from ""           <span class="timestamp-wrapper"><span class="timestamp">[2016-05-30 Mon 20:36]</span></span>

### Configuration<a id="sec-1-20-1" name="sec-1-20-1"></a>

    (use-package smartparens
      :config
      (require 'smartparens-config)
      (setq sp-autoescape-string-quote nil)
      (--each '(css-mode-hook
                restclient-mode-hook
                js-mode-hook
                java-mode
                ruby-mode
                markdown-mode
                groovy-mode)
        (add-hook it 'turn-on-smartparens-mode))
    
    )

## Expand-region<a id="sec-1-21" name="sec-1-21"></a>

### Configuration<a id="sec-1-21-1" name="sec-1-21-1"></a>

    (use-package expand-region
      :config
      ;; Don't use expand-region fast keys
      (setq expand-region-fast-keys-enabled nil)
    
      ;; Show expand-region command used
      (setq er--show-expansion-message t)
    
      )

### Key bindings for Expand-region<a id="sec-1-21-2" name="sec-1-21-2"></a>

    ;; Expand region (increases selected region by semantic units)
    (global-set-key (kbd "C-'") 'er/expand-region)

## Swap-buffer<a id="sec-1-22" name="sec-1-22"></a>

### Configuration<a id="sec-1-22-1" name="sec-1-22-1"></a>

    ;; add smart swap buffers in multi-windows
    (use-package swap-buffers
      :config
      (global-set-key (kbd "C-x 5") 'swap-buffers)
    )

## Email Reader - Mu4e<a id="sec-1-23" name="sec-1-23"></a>

Please find [Init-Mu4e](../lisp/init-mu4e.md).

    ;; load my mu4e configuration from init-mu4e.el
    ;;(require 'init-mu4e)
      (starter-kit-load "03-For-an-editor/init-mu4e.org")
    
    
    ;;(load-library "init-mu4e")

## Multiple cursors mode<a id="sec-1-24" name="sec-1-24"></a>

Multiple cursor是一个非常强大的多位置同时编辑的编辑模式，文档可参考：
这里有一个介绍详细的视频：<http://emacsrocks.com/e13.html>

### Configuration<a id="sec-1-24-1" name="sec-1-24-1"></a>

    (use-package multiple-cursors
      :defer t
      :bind
       (("C-c m t" . mc/mark-all-like-this)
        ("C-c m m" . mc/mark-all-like-this-dwim)
        ("C-c m l" . mc/edit-lines)
        ("C-c m e" . mc/edit-ends-of-lines)
        ("C-c m a" . mc/edit-beginnings-of-lines)
        ("C-c m n" . mc/mark-next-like-this)
        ("C-c m p" . mc/mark-previous-like-this)
        ("C-c m s" . mc/mark-sgml-tag-pair)
        ("C-c m d" . mc/mark-all-like-this-in-defun)))
    (use-package phi-search
      :defer t)
    (use-package phi-search-mc
      :defer t
      :config (phi-search-mc/setup-keys))
    (use-package mc-extras
      :defer t
      :config (define-key mc/keymap (kbd "C-. =") 'mc/compare-chars))

### Short-key binding<a id="sec-1-24-2" name="sec-1-24-2"></a>

    ;; add multi cursors:
    ;;(require 'multiple-cursors)
    (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
    (global-set-key (kbd "C->") 'mc/mark-next-like-this)
    (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
    (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
    
    (global-set-key (kbd "C-S-c C-e") 'mc/edit-ends-of-lines)
    (global-set-key (kbd "C-S-c C-a") 'mc/edit-beginnings-of-lines)

## Latex mode<a id="sec-1-25" name="sec-1-25"></a>

    ;;; latex --- Summary
    ;;; Config for latex
    (use-package auctex
      :defer t)
    
    (use-package cdlatex
      :defer t
      :config
      (add-hook 'LaTex-mode-hook 'turn-on-org-cdlatex) ;; with AUCTex LaTex mode-line
      (add-hook 'LaTex-mode-hook 'turn-on-org-cdlatex) ;; with Emacs latex mode
    )
    ;; (add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)   ; with AUCTeX LaTeX mode
    ;; (add-hook 'latex-mode-hook 'turn-on-cdlatex)   ; with Emacs latex mode
    
    ;; latex-preview-pane is a minor mode for Emacs that enables you to preview your LaTeX files directly in Emacs.
    
    
    (use-package latex-preview-pane
      :defer t
      :config
      (latex-preview-pane-enable))
    ;;(latex-preview-pane-enable)
    
    ;; magical syntax highlighting for LaTeX-mode buffers
    ;;(require-package 'magic-latex-buffer)
    (use-package magic-latex-buffer
      :defer t
      :config
      (add-hook 'latex-mode-hook 'magic-latex-buffer))
    ;;(add-hook 'latex-mode-hook 'magic-latex-buffer)
    
    ;;  Adds several useful functionalities to LaTeX-mode. http://github.com/Bruce-Connor/latex-extra
    
    (use-package latex-extra
      :defer t
      :config
      (add-hook 'latex-mode-hook 'latex-extra-mode))
    
    ;;(add-hook 'LaTeX-mode-hook #'latex-extra-mode)

## TODO Wgrep<a id="sec-1-26" name="sec-1-26"></a>

Wgrep是一个可以允许我们在grep模式下进行直接修改的工具，可以允许我们批量添加上Multiple cursors，然后进行批量修改的工具。在快速修改文件时非常方便，类似于sed的批量匹配，批量修改。

    ;;; 未配置详细操作，暂时不使用
    (use-package wgrep)

## Tabbar<a id="sec-1-27" name="sec-1-27"></a>

Tabbar，在Emacs中显示一个文件的切换标签，并且标签文件按projectile的进行分组显示，以方便在同一个项目中进行维护和切换文件。

### Configuration<a id="sec-1-27-1" name="sec-1-27-1"></a>

    (use-package tabbar)
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Interactive Functions ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    (defun tabbar-select-end-tab ()
      "Select end tab of current tabset."
      (interactive)
      (tabbar-select-beg-tab t))
    
    (defun tabbar-select-beg-tab (&optional backward type)
      "Select beginning tab of current tabs.
    If BACKWARD is non-nil, move backward, otherwise move forward.
    TYPE is default option."
      (interactive)
      (let* ((tabset (tabbar-current-tabset t))
             (ttabset (tabbar-get-tabsets-tabset))
             (cycle (if (and (eq tabbar-cycle-scope 'groups)
                             (not (cdr (tabbar-tabs ttabset))))
                        'tabs
                      tabbar-cycle-scope))
             selected tab)
        (when tabset
          (setq selected (tabbar-selected-tab tabset))
          (setq tabset (tabbar-tabs tabset)
                tab (car (if backward (last tabset) tabset)))
          (tabbar-click-on-tab tab type))))
    
    (defun tabbar-backward-tab-other-window (&optional reversed)
      "Move to left tab in other window.
    Optional argument REVERSED default is move backward, if reversed is non-nil move forward."
      (interactive)
      (other-window 1)
      (if reversed
          (tabbar-forward-tab)
        (tabbar-backward-tab))
      (other-window -1))
    
    (defun tabbar-forward-tab-other-window ()
      "Move to right tab in other window."
      (interactive)
      (tabbar-backward-tab-other-window t))
    
    
    
    ;;; Code:
    
    (defcustom tabbar-hide-header-button t
      "Hide header button at left-up corner.
    Default is t."
      :type 'boolean
      :set (lambda (symbol value)
             (set symbol value)
             (if value
                 (setq
                  tabbar-scroll-left-help-function nil ;don't show help information
                  tabbar-scroll-right-help-function nil
                  tabbar-help-on-tab-function nil
                  tabbar-home-help-function nil
                  tabbar-buffer-home-button (quote (("") "")) ;don't show tabbar button
                  tabbar-scroll-left-button (quote (("") ""))
                  tabbar-scroll-right-button (quote (("") "")))))
      :group 'tabbar)
    
    (defun tabbar-filter (condp lst)
      (delq nil
            (mapcar (lambda (x) (and (funcall condp x) x)) lst)))
    
    (defun tabbar-filter-buffer-list ()
      (tabbar-filter
       (lambda (x)
         (let ((name (format "%s" x)))
           (and
            (not (string-prefix-p "*epc" name))
            (not (string-prefix-p "*helm" name))
            (not (string-prefix-p "*Messages*" name))
            )))
       (delq nil
             (mapcar #'(lambda (b)
                         (cond
                          ;; Always include the current buffer.
                          ((eq (current-buffer) b) b)
                          ((buffer-file-name b) b)
                          ((char-equal ?\  (aref (buffer-name b) 0)) nil)
                          ((buffer-live-p b) b)))
                     (buffer-list)))))
    
    (setq tabbar-buffer-list-function 'tabbar-filter-buffer-list)
    
    
    
    (defvar tabbar-ruler-projectile-tabbar-buffer-group-calc nil
      "Buffer group for projectile.  Should be buffer local and speed up calculation of buffer groups.")
    (defun tabbar-ruler-projectile-tabbar-buffer-groups ()
      "Return the list of group names BUFFER belongs to.
        Return only one group for each buffer."
    
      (if tabbar-ruler-projectile-tabbar-buffer-group-calc
          (symbol-value 'tabbar-ruler-projectile-tabbar-buffer-group-calc)
        (set (make-local-variable 'tabbar-ruler-projectile-tabbar-buffer-group-calc)
    
             (cond
              ((or (get-buffer-process (current-buffer)) (memq major-mode '(comint-mode compilation-mode))) '("Term"))
              ((string-equal "*" (substring (buffer-name) 0 1)) '("Misc"))
              ((condition-case err
                   (projectile-project-root)
                 (error nil)) (list (projectile-project-name)))
              ((memq major-mode '(emacs-lisp-mode python-mode emacs-lisp-mode c-mode c++-mode makefile-mode lua-mode vala-mode)) '("Coding"))
              ((memq major-mode '(javascript-mode js-mode nxhtml-mode html-mode css-mode)) '("HTML"))
              ((memq major-mode '(org-mode calendar-mode diary-mode)) '("Org"))
              ((memq major-mode '(dired-mode)) '("Dir"))
              (t '("Main"))))
        (symbol-value 'tabbar-ruler-projectile-tabbar-buffer-group-calc)))
    
    (defun tabbar-ruler-group-by-projectile-project()
      "Group by projectile project."
      (interactive)
      (setq tabbar-buffer-groups-function 'tabbar-ruler-projectile-tabbar-buffer-groups))
    
    
    
    ;; group by projectile
    (tabbar-ruler-group-by-projectile-project)
    (tabbar-mode)

### Key binding<a id="sec-1-27-2" name="sec-1-27-2"></a>

    ;; -----------------------------------------
    ;; start tabbar-mode
    ;; -----------------------------------------
    (global-set-key (kbd "C-c t") 'tabbar-mode)
    ;; Tabbar, following is default key binding, no need to set again
    ;;(global-set-key (kbd "C-c <C-left>") 'tabbar-forward-tab)
    ;;(global-set-key (kbd "C-c <C-right>") 'tabbar-backward-tab)
    ;;(global-set-key (kbd "C-c <C-up>") 'tabbar-forward-group)
    ;;(global-set-key (kbd "C-c <C-down>") 'tabbar-backward-group)

## Perspective<a id="sec-1-28" name="sec-1-28"></a>

### Configuration<a id="sec-1-28-1" name="sec-1-28-1"></a>

    (use-package perspective
      :config
      ;; Enable perspective mode
      (progn
        (persp-mode t)
        ;; TODO: implement persp-last as before-advice on persp-switch (?)
    
        (defmacro custom-persp (name &rest body)
          `(let ((initialize (not (gethash ,name perspectives-hash)))
                 (current-perspective persp-curr))
             (persp-switch ,name)
             (when initialize ,@body)
             (setq persp-last current-perspective)))
    
        ;; Jump to last perspective
        (defun custom-persp-last ()
          (interactive)
          (persp-switch (persp-name persp-last)))
    
        (define-key persp-mode-map (kbd "C-x p -") 'custom-persp-last)
        )
    )

## Ido<a id="sec-1-29" name="sec-1-29"></a>

Ido工具是为在窗口下面的状态栏中选择、显示时更清晰，操作更方便，并支持模糊匹配选择，这里只保留选择文件时启动ido，其它时间切换buffer等，采用helm进行。

### Configuration<a id="sec-1-29-1" name="sec-1-29-1"></a>

    ;; Use C-f during file selection to switch to regular find-file
    (ido-mode t)
    ;;(ido-everywhere t)
    (setq ido-enable-flex-matching t)
    (setq ido-use-filename-at-point nil)
    (setq ido-auto-merge-work-directories-length 0)
    (setq ido-use-virtual-buffers t)

## Multiple Major Mode<a id="sec-1-30" name="sec-1-30"></a>

### Configuration<a id="sec-1-30-1" name="sec-1-30-1"></a>

    (use-package mmm-mode
      :config
      ;;(require 'mmm-auto)
      (setq mmm-global-mode 'buffers-with-submode-classes)
      (setq mmm-submode-decoration-level 2)
    
      )
