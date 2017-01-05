<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Orgmode Configuration</a>
<ul>
<li><a href="#sec-1-1">1.1. Base configuration</a>
<ul>
<li><a href="#sec-1-1-1">1.1.1. Org Structure Template</a></li>
<li><a href="#sec-1-1-2">1.1.2. Config for global function</a></li>
</ul>
</li>
<li><a href="#sec-1-2">1.2. Org Capture</a>
<ul>
<li><a href="#sec-1-2-1">1.2.1. Configuration</a></li>
<li><a href="#sec-1-2-2">1.2.2. Shot-key bindings</a></li>
</ul>
</li>
<li><a href="#sec-1-3">1.3. Refile</a>
<ul>
<li><a href="#sec-1-3-1">1.3.1. Configuration</a></li>
<li><a href="#sec-1-3-2">1.3.2. Shot-key binding</a></li>
</ul>
</li>
<li><a href="#sec-1-4">1.4. Org Clocking</a>
<ul>
<li><a href="#sec-1-4-1">1.4.1. Configuration</a></li>
<li><a href="#sec-1-4-2">1.4.2. Shot-key bindings</a></li>
</ul>
</li>
<li><a href="#sec-1-5">1.5. Picture drawing mode</a>
<ul>
<li><a href="#sec-1-5-1">1.5.1. Configuration</a></li>
<li><a href="#sec-1-5-2">1.5.2. How to use it</a></li>
</ul>
</li>
<li><a href="#sec-1-6">1.6. Config for TODO</a>
<ul>
<li><a href="#sec-1-6-1">1.6.1. Configuration</a></li>
<li><a href="#sec-1-6-2">1.6.2. Shot-key bindings</a></li>
</ul>
</li>
<li><a href="#sec-1-7">1.7. Config for Tag</a>
<ul>
<li><a href="#sec-1-7-1">1.7.1. Configuration</a></li>
<li><a href="#sec-1-7-2">1.7.2. Shot-key binding</a></li>
</ul>
</li>
<li><a href="#sec-1-8">1.8. Global column view and properties</a>
<ul>
<li><a href="#sec-1-8-1">1.8.1. Shot-key binding</a></li>
</ul>
</li>
<li><a href="#sec-1-9">1.9. Config for File Export HTML Format</a>
<ul>
<li><a href="#sec-1-9-1">1.9.1. Configuration</a></li>
</ul>
</li>
<li><a href="#sec-1-10">1.10. Config for File Export PDF Format</a>
<ul>
<li><a href="#sec-1-10-1">1.10.1. Configuration</a></li>
<li><a href="#sec-1-10-2">1.10.2. </a></li>
</ul>
</li>
<li><a href="#sec-1-11">1.11. Config for File Export PDF but use beamer Format</a>
<ul>
<li><a href="#sec-1-11-1">1.11.1. Configuration</a></li>
</ul>
</li>
</ul>
</li>
<li><a href="#sec-2">2. Orgmode table Configuration</a></li>
<li><a href="#sec-3">3. Chinese-font-setup</a>
<ul>
<li><a href="#sec-3-1">3.1. Configuration</a></li>
<li><a href="#sec-3-2">3.2. Shot key binding</a></li>
</ul>
</li>
<li><a href="#sec-4">4. Key bindings for Orgmode</a>
<ul>
<li><a href="#sec-4-1">4.1. Key bindings configurations</a></li>
<li><a href="#sec-4-2">4.2. Key binding for org-mode</a></li>
<li><a href="#sec-4-3">4.3. Orgmode keybindings from orginal ormode.org</a></li>
</ul>
</li>
<li><a href="#sec-5">5. Org文件批量管理</a></li>
<li><a href="#sec-6">6. End of file</a></li>
</ul>
</div>
</div>


# Orgmode Configuration<a id="sec-1" name="sec-1"></a>

Org-mode是Emacs中最常用的一个模式，在此模式下，可以支持文档编辑、任务管理、项目管理、GTD相关的任务管理等，另外在此模式下，可以借助一些工具在org-mdoe下进行画图，并可以将文档导出html, markdown, pdf等格式。 

## Base configuration<a id="sec-1-1" name="sec-1-1"></a>

### Org Structure Template<a id="sec-1-1-1" name="sec-1-1-1"></a>

定义一部分在orgmode下编写代码块的快捷模板，此快捷模板可以通过 `(<s[TAB])` 的方式快捷输入模板块，如下以此类推，输入 `(<e[TAB])` 即可输入另外的模板。

    (setq org-structure-template-alist
          '(("s" "#+begin_src ?\n\n#+end_src" "<src lang=\"?\">\n\n</src>")
            ("e" "#+begin_example\n?\n#+end_example" "<example>\n?\n</example>")
            ("q" "#+begin_quote\n?\n#+end_quote" "<quote>\n?\n</quote>")
            ("v" "#+BEGIN_VERSE\n?\n#+END_VERSE" "<verse>\n?\n</verse>")
            ("c" "#+BEGIN_COMMENT\n?\n#+END_COMMENT")
            ("p" "#+BEGIN_PRACTICE\n?\n#+END_PRACTICE")
            ("o" "#+begin_src emacs-lisp :tangle yes\n?\n#+end_src" "<src lang=\"emacs-lisp\">\n?\n</src>")
            ("l" "#+begin_src emacs-lisp\n?\n#+end_src" "<src lang=\"emacs-lisp\">\n?\n</src>")
            ("L" "#+latex: " "<literal style=\"latex\">?</literal>")
            ("h" "#+begin_html\n?\n#+end_html" "<literal style=\"html\">\n?\n</literal>")
            ("H" "#+html: " "<literal style=\"html\">?</literal>")
            ("a" "#+begin_ascii\n?\n#+end_ascii")
            ("A" "#+ascii: ")
            ("i" "#+index: ?" "#+index: ?")
            ("I" "#+include %file ?" "<include file=%file markup=\"?\">")))

### Config for global function<a id="sec-1-1-2" name="sec-1-1-2"></a>

    ;;================================================================
    ;; Config for Global function
    ;;================================================================
    ;; auto save files
    (run-at-time "00:59" 3600 'org-save-all-org-buffers)
    
    ;; org-mode
    (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
    
    
    ;; set export table's format
    (setq org-table-export-default-format "orgtbl-to-csv")
    
    (custom-set-variables
     '(org-export-table-data-tags '("<tr class=\"CUSTOM_ID>" . "</t>")))
    
    ;; auto load markdown-mode when load org-mode
    (eval-after-load "org"
      '(require 'ox-md nil t))

## Org Capture<a id="sec-1-2" name="sec-1-2"></a>

Org Capture是Org-mode中用来快速创建任务的功能，具体的应用场景为：当我正在工作或者写文档的同时，接了个电话，或者想起一个事情需要记录或者需要写入工作清单中，或者需要有一个电话打，为了不中断当前的工作，Org capture可以让我快速的记录，并设定时间，完成Org capture的录入10秒内就可以完成了。不影响当前的工作。

通过配置，可以将常用的工作任务分类添加，具体可以参照我的配置，可以做一些自己的修改。
按照下面的配置，我将日常工作分为如下几种情况：

<!-- This HTML table template is generated by emacs 24.5.1 -->
<table border="1">
  <tr>
    <td align="left" valign="top">
      TODO&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
  </tr>
  <tr>
    <td align="left" valign="top">
      NOTS&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
  </tr>
  <tr>
    <td align="left" valign="top">
      &nbsp;Journal
    </td>
  </tr>
  <tr>
    <td align="left" valign="top">
      &nbsp;Meeting
    </td>
  </tr>
  <tr>
    <td align="left" valign="top">
      &nbsp;PHONE&nbsp;&nbsp;
    </td>
  </tr>
</table>

### Configuration<a id="sec-1-2-1" name="sec-1-2-1"></a>

    ;;================================================================
    ;; Config for Org Capture
    ;;================================================================
    ;; config for org-mode
    ;; add some capture config
    (setq org-directory "~/workspace/github/my-blog/work-notes/captures")
    ;;(setq org-default-notes-file (concat org-directory "/notes.org"))
    ;;(define-key global-map (kbd "M-<f6>") 'org-capture)
    
    
    ;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
    (setq org-capture-templates
          (quote (("t" "TODO" entry (file (concat org-directory "/refile.org"))
                   "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
                  ("r" "RESPONED" entry  (file (concat org-directory "/refile.org"))
                   "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
                  ("n" "NOTES" entry  (file (concat org-directory "/notes.org"))
                   "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
                  ("j" "Journal" entry  (file (concat org-directory "/refile.org"))
                   "* %?\n%U\n" :clock-in t :clock-resume t)
                  ("w" "org-protocol" entry  (file (concat org-directory "/refile.org"))
                   "* TODO Review %c\n%U\n" :immediate-finish t)
                  ("m" "Meeting" entry  (file (concat org-directory "/refile.org"))
                   "* MEETING with %? :MEETING:\n  :SUBJECT:\n%U\n" :clock-in t :clock-resume t)
                  ("p" "Phone call" entry  (file (concat org-directory "/refile.org"))
                   "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
                  ("h" "Habit" entry  (file (concat org-directory "/refile.org"))
                   "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"<%Y-%m-%d %a .+1d/3d>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))

### Shot-key bindings<a id="sec-1-2-2" name="sec-1-2-2"></a>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="left" />

<col  class="left" />
</colgroup>
<tbody>
<tr>
<td class="left">Capture</td>
<td class="left">C-c c</td>
<td class="left">打开capture</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>
</tbody>
</table>

    ;; add ~/notes/front-end-dev-plan.org into agenda
    
    (global-set-key "\C-c a" 'org-agenda)
    ;; I use C-c c to start capture mode
    (global-set-key (kbd "C-c c") 'org-capture)

## Refile<a id="sec-1-3" name="sec-1-3"></a>

Refile，则是针对Org capture的一个补充，Org capture会将创建的任务、日志等内容存储在一个单独的文件中，或者多个文件中，如果需要将某个节点重新进行分配，或者迁移到另一个文件中，则可以通过refile来进行迁移节点。

### Configuration<a id="sec-1-3-1" name="sec-1-3-1"></a>

    ;;================================================================
    ;; Config for Refile
    ;;================================================================
    ;;
    
    
    ;; Targets include this file and any file contributing to the agenda - up to 9 levels deep
    (setq org-refile-targets (quote ((nil :maxlevel . 9)
                                     (org-agenda-files :maxlevel . 9))))
    
    ;; Use full outline paths for refile targets - we file directly with IDO
    (setq org-refile-use-outline-path t)
    
    ;; Targets complete directly with IDO
    (setq org-outline-path-complete-in-steps nil)
    
    ;; Allow refile to create parent tasks with confirmation
    (setq org-refile-allow-creating-parent-nodes (quote confirm))
    
    ;; Use IDO for both buffer and file completion and ido-everywhere to t
    (setq org-completion-use-ido t)
    (setq ido-everywhere t)
    (setq ido-max-directory-size 100000)
    (ido-mode (quote both))
    ;; Use the current window when visiting files and buffers with ido
    (setq ido-default-file-method 'selected-window)
    (setq ido-default-buffer-method 'selected-window)
    ;; Use the current window for indirect buffer display
    (setq org-indirect-buffer-display 'current-window)
    
    ;;;; Refile settings
    ;; Exclude DONE state tasks from refile targets
    (defun bh/verify-refile-target ()
      "Exclude todo keywords with a done state from refile targets"
      (not (member (nth 2 (org-heading-components)) org-done-keywords)))
    
    (setq org-refile-target-verify-function 'bh/verify-refile-target)

### Shot-key binding<a id="sec-1-3-2" name="sec-1-3-2"></a>

当前的配置操作快捷键：

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="left" />

<col  class="left" />
</colgroup>
<tbody>
<tr>
<td class="left">Refile</td>
<td class="left">C-c C-w</td>
<td class="left">将此标签任务迁移到其它文件中</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c M-w</td>
<td class="left">同上，并保留当前文件内容</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>
</tbody>
</table>

## Org Clocking<a id="sec-1-4" name="sec-1-4"></a>

Org clocking模式，在任务上启动clocking，则开始对特定任务启动计时，并通过clocking 统计在各个任务中花的时间，通过汇总统计，则可以检查一天的工作情况。

### Configuration<a id="sec-1-4-1" name="sec-1-4-1"></a>

    ;;================================================================
    ;; Config for Clock
    ;;================================================================
    ;;
    
    ;;
    ;; Resume clocking task when emacs is restarted
    (org-clock-persistence-insinuate)
    ;;
    ;; Show lot of clocking history so it's easy to pick items off the C-F11 list
    (setq org-clock-history-length 23)
    ;; Resume clocking task on clock-in if the clock is open
    (setq org-clock-in-resume t)
    ;; Change tasks to NEXT when clocking in
    (setq org-clock-in-switch-to-state 'bh/clock-in-to-next)
    ;; Separate drawers for clocking and logs
    (setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))
    ;; Save clock data and state changes and notes in the LOGBOOK drawer
    (setq org-clock-into-drawer t)
    ;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
    (setq org-clock-out-remove-zero-time-clocks t)
    ;; Clock out when moving task to a done state
    (setq org-clock-out-when-done t)
    ;; Save the running clock and all clock history when exiting Emacs, load it on startup
    (setq org-clock-persist t)
    ;; Do not prompt to resume an active clock
    (setq org-clock-persist-query-resume nil)
    ;; Enable auto clock resolution for finding open clocks
    (setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
    ;; Include current clocking task in clock reports
    (setq org-clock-report-include-clocking-task t)
    
    (setq bh/keep-clock-running nil)
    
    (defun bh/clock-in-to-next (kw)
      "Switch a task from TODO to NEXT when clocking in.
    Skips capture tasks, projects, and subprojects.
    Switch projects and subprojects from NEXT back to TODO"
      (when (not (and (boundp 'org-capture-mode) org-capture-mode))
        (cond
         ((and (member (org-get-todo-state) (list "TODO"))
               (bh/is-task-p))
          "NEXT")
         ((and (member (org-get-todo-state) (list "NEXT"))
               (bh/is-project-p))
          "TODO"))))
    
    (defun bh/find-project-task ()
      "Move point to the parent (project) task if any"
      (save-restriction
        (widen)
        (let ((parent-task (save-excursion (org-back-to-heading 'invisible-ok) (point))))
          (while (org-up-heading-safe)
            (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
              (setq parent-task (point))))
          (goto-char parent-task)
          parent-task)))
    
    (defun bh/punch-in (arg)
      "Start continuous clocking and set the default task to the
    selected task.  If no task is selected set the Organization task
    as the default task."
      (interactive "p")
      (setq bh/keep-clock-running t)
      (if (equal major-mode 'org-agenda-mode)
          ;;
          ;; We're in the agenda
          ;;
          (let* ((marker (org-get-at-bol 'org-hd-marker))
                 (tags (org-with-point-at marker (org-get-tags-at))))
            (if (and (eq arg 4) tags)
                (org-agenda-clock-in '(16))
              (bh/clock-in-organization-task-as-default)))
        ;;
        ;; We are not in the agenda
        ;;
        (save-restriction
          (widen)
                                            ; Find the tags on the current task
          (if (and (equal major-mode 'org-mode) (not (org-before-first-heading-p)) (eq arg 4))
              (org-clock-in '(16))
            (bh/clock-in-organization-task-as-default)))))
    
    (defun bh/punch-out ()
      (interactive)
      (setq bh/keep-clock-running nil)
      (when (org-clock-is-active)
        (org-clock-out))
      (org-agenda-remove-restriction-lock))
    
    (defun bh/clock-in-default-task ()
      (save-excursion
        (org-with-point-at org-clock-default-task
          (org-clock-in))))
    
    (defun bh/clock-in-parent-task ()
      "Move point to the parent (project) task if any and clock in"
      (let ((parent-task))
        (save-excursion
          (save-restriction
            (widen)
            (while (and (not parent-task) (org-up-heading-safe))
              (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
                (setq parent-task (point))))
            (if parent-task
                (org-with-point-at parent-task
                  (org-clock-in))
              (when bh/keep-clock-running
                (bh/clock-in-default-task)))))))
    
    (defvar bh/organization-task-id "eb155a82-92b2-4f25-a3c6-0304591af2f9")
    
    (defun bh/clock-in-organization-task-as-default ()
      (interactive)
      (org-with-point-at (org-id-find bh/organization-task-id 'marker)
        (org-clock-in '(16))))
    
    (defun bh/clock-out-maybe ()
      (when (and bh/keep-clock-running
                 (not org-clock-clocking-in)
                 (marker-buffer org-clock-default-task)
                 (not org-clock-resolving-clocks-due-to-idleness))
        (bh/clock-in-parent-task)))
    
    (add-hook 'org-clock-out-hook 'bh/clock-out-maybe 'append)
    
    (defun bh/resume-clock ()
      (interactive)
      (if (marker-buffer org-clock-interrupted-task)
          (org-with-point-at org-clock-interrupted-task
            (org-clock-in))
        (org-clock-out)))
    
    (require 'org-id)
    (defun bh/clock-in-task-by-id (id)
      "Clock in a task by id"
      (org-with-point-at (org-id-find id 'marker)
        (org-clock-in nil)))
    
    (defun bh/clock-in-last-task (arg)
      "Clock in the interrupted task if there is one
    Skip the default task and get the next one.
    A prefix arg forces clock in of the default task."
      (interactive "p")
      (let ((clock-in-to-task
             (cond
              ((eq arg 4) org-clock-default-task)
              ((and (org-clock-is-active)
                    (equal org-clock-default-task (cadr org-clock-history)))
               (caddr org-clock-history))
              ((org-clock-is-active) (cadr org-clock-history))
              ((equal org-clock-default-task (car org-clock-history)) (cadr org-clock-history))
              (t (car org-clock-history)))))
        (widen)
        (org-with-point-at clock-in-to-task
          (org-clock-in nil))))

### Shot-key bindings<a id="sec-1-4-2" name="sec-1-4-2"></a>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="left" />

<col  class="left" />
</colgroup>
<tbody>
<tr>
<td class="left">Clocking</td>
<td class="left">C-c C-x C-i</td>
<td class="left">开始clock</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-x C-o</td>
<td class="left">退出clock</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-x C-r</td>
<td class="left">插入clock table</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-x ;</td>
<td class="left">Start a count down time</td>
</tr>
</tbody>
</table>

    ;; config for clocking
    ;; (global-set-key (kbd "<f9> I") 'bh/punch-in)
    ;; (global-set-key (kbd "<f9> O") 'bh/punch-out)
    
    ;; (global-set-key (kbd "<f9> l") 'org-toggle-link-display)
    ;; (global-set-key (kbd "<f9> SPC") 'bh/clock-in-last-task)
    
    ;; (global-set-key (kbd "<f11>") 'org-clock-goto)
    ;; (global-set-key (kbd "C-<f11>") 'org-clock-in)

## Picture drawing mode<a id="sec-1-5" name="sec-1-5"></a>

此功能可以支持在org-mdoe中通过文本方式，或代码方式进行画图，通过plantuml, ditaa等插件来进行画图。

### Configuration<a id="sec-1-5-1" name="sec-1-5-1"></a>

    ;;================================================================
    ;; Config for Picture Drawing
    ;;================================================================
    ;; set for plantuml
    (setq org-ditaa-jar-path "~/.emacs.d/ditaa0_9.jar")
    (setq org-plantuml-jar-path "~/.emacs.d/plantuml.8031.jar")
    ;; Use fundamental mode when editing plantuml blocks with C-c '
    (add-to-list 'org-src-lang-modes (quote ("plantuml" . fundamental)))

### How to use it<a id="sec-1-5-2" name="sec-1-5-2"></a>

<http://www.plantuml.com/>
-   安装依赖
    在archlinux的aur中找到plantuml进行安装；
-   使用，在需要生成的图的位置代码用如何代码框起来

     #+begin_src plantuml :file some_filename.png :cmdline -r -s 0.8
    <context of ditaa source goes here>
     #+end_src

## Config for TODO<a id="sec-1-6" name="sec-1-6"></a>

TODO用来管理org mode中的任务状态，如下配置中，将任务状态分配置为下面几种；

### Configuration<a id="sec-1-6-1" name="sec-1-6-1"></a>

    ;;================================================================
    ;; Config for TODO Configuration
    ;;================================================================
    ;; (setq org-todo-keywords
    ;;       (quote (;;(sequence "TODO(t)" "NEXT(n)" "MAYBE(m)" "STARTED(s)" "APPT(a)" "|" "DONE(d)")
    ;;               (sequence "TODO(t)" "NEXT(n)" "STARTED(s)" "|" "DONE(d)")
    ;;               (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))
    
    (setq org-todo-keywords
          (quote ((sequence "TODO(t)" "NEXT(n)" "STARTED(s)" "MAYBE(m)" "|" "DONE(d!/!)")
                  (sequence "PROJECT(p)" "|" "DONE(d!/!)" "CANCELLED(c@/!)")
                  (sequence "WAITING(w@/!)" "HOLD(h)" "|" "CANCELLED(c@/!)"))))
    
    (setq org-todo-keyword-faces
          (quote (;;("NEXT" :inherit warning)
                  ("PROJECT" :inherit font-lock-string-face)
                  ("TODO" :foreground "red" :weight bold)
                  ("NEXT" :foreground "blue" :weight bold)
                  ("STARTED" :foreground "green" :weight bold)
                  ("DONE" :foreground "forest green" :weight bold)
                  ("WAITING" :foreground "orange" :weight bold)
                  ("MAYBE" :foreground "grey" :weight bold)
                  ("HOLD" :foreground "magenta" :weight bold)
                  ("CANCELLED" :foreground "forest green" :weight bold)
                  )))
    
    
    (setq org-use-fast-todo-selection t)
    (setq org-todo-state-tags-triggers
          (quote (("CANCELLED" ("CANCELLED" . t))
                  ("WAITING" ("WAITING" . t))
                  ("MAYBE" ("WAITING" . t))
                  ("HOLD" ("WAITING") ("HOLD" . t))
                  (done ("WAITING") ("HOLD"))
                  ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
                  ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
                  ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

### Shot-key bindings<a id="sec-1-6-2" name="sec-1-6-2"></a>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="left" />

<col  class="left" />
</colgroup>
<tbody>
<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-t</td>
<td class="left">设置TODO标签</td>
</tr>
</tbody>
</table>

## Config for Tag<a id="sec-1-7" name="sec-1-7"></a>

### Configuration<a id="sec-1-7-1" name="sec-1-7-1"></a>

    ;;================================================================
    ;; Config for Tags
    ;;================================================================
    ;; Config TODO tags
    (setq org-tag-alist '((:startgroup)
                          ("Develop" . ?1)
                          (:grouptags )
                          ("陆健美" . ?z)
                          (:endgroup)
    
                          ))
    ;; Allow setting single tags without the menu
    (setq org-fast-tag-selection-single-key (quote expert))
    
    ;; For tag searches ignore tasks with scheduled and deadline dates
    (setq org-agenda-tags-todo-honor-ignore-options t)

### Shot-key binding<a id="sec-1-7-2" name="sec-1-7-2"></a>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="left" />

<col  class="left" />
</colgroup>
<tbody>
<tr>
<td class="left">Tags</td>
<td class="left">C-c C-c C-c</td>
<td class="left">打开tag选择窗口，然后通过字母索引选择tag</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">SPC</td>
<td class="left">清除所有tag</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-c</td>
<td class="left">可以直接输入tag的单词直接进行选择</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-x C-c</td>
<td class="left">打开列展示视图</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">q</td>
<td class="left">退出列视图</td>
</tr>
</tbody>
</table>

## Global column view and properties<a id="sec-1-8" name="sec-1-8"></a>

Column view是建立于org-mode任务管理之上的快速以表格查看各个任务情况的视图，可以使用 **C-c C-x C-c** 来打开column view，而此种查看方式只是一种查看，并不会被打印，如果需要通过动态管理column view，并支持打印，可以通过 **C-c C-x i** 插入一个动态的column部分在文件中，但此部分不是动态关联的，即修改了任务内容，插入的column view是不会更新的，但可以通过执行 **C-c C-x C-u** 进行更新；注：已经通过配置(add-hook 'before-save-hook 'org-update-all-dblocks)达到在保存文件时，即会更新文件中所有的column view中的数据；
当需要针对某一个特定的任务组生成一个column view时，可以在此任务组的任务上，执行 **C-c C-x p** 插入属性，选择id，输入一个id值，然后在插入动态column时，选择刚刚输入的id值即可；如果需要对这个表特殊定义不同的column结构，可以再执行 **C-c C-x p** 时选择 **COLUMN** 来重新定义一个新的column结构内容；保存即可自动更新表s格；

    ;;================================================================
    ;; Config for Global column view and properties
    ;;================================================================
    ;; Set default column view headings: Task Effort Clock_Summary
    ;;(setq org-columns-default-format "%25ITEM %10Effort(Effort){:} %SCHEDULED %DEADLINE %11Status %20TAGS %PRIORITY %TODO")
    ;;(setq org-columns-default-format "%25ITEM  %9Approved(Approved?){X} %SCHEDULED %DEADLINE %11Status %TAGS %PRIORITY %TODO")
    (setq org-columns-default-format
          ;;" %TODO %30ITEM %15DEADLINE %15SCHEDULED %3PRIORITY %10TAGS %5Effort(Effort){:} %6CLOCKSUM"
          " %TODO %30ITEM %15DEADLINE %15SCHEDULED %3PRIORITY %10TAGS %5Effort(Effort){:}"
          )
    
    ;; global Effort estimate values
    ;; global STYLE property values for completion
    (setq org-global-properties (quote (
                                        ;;("Effort_ALL" . "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 0:00")
                                        ("Status_ALL" . "Not-start In-Progress Delay Finished Cancled")
                                        ("ID_ALL" . "")
                                        ("STYLE_ALL" . "habit"))))
    ;; update dynamic blocks when save file
    (add-hook 'before-save-hook 'org-update-all-dblocks)

### Shot-key binding<a id="sec-1-8-1" name="sec-1-8-1"></a>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="left" />

<col  class="left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">column</th>
<th scope="col" class="left">C-c C-x C-c</th>
<th scope="col" class="left">打开column视图模式</th>
</tr>


<tr>
<th scope="col" class="left">&#xa0;</th>
<th scope="col" class="left">r</th>
<th scope="col" class="left">刷新</th>
</tr>


<tr>
<th scope="col" class="left">&#xa0;</th>
<th scope="col" class="left">q</th>
<th scope="col" class="left">退出</th>
</tr>


<tr>
<th scope="col" class="left">&#xa0;</th>
<th scope="col" class="left"><left> <right> <up> <down></th>
<th scope="col" class="left">视图之间跳转</th>
</tr>


<tr>
<th scope="col" class="left">&#xa0;</th>
<th scope="col" class="left">v</th>
<th scope="col" class="left">查看属性完整值</th>
</tr>


<tr>
<th scope="col" class="left">&#xa0;</th>
<th scope="col" class="left">C-c C-x i</th>
<th scope="col" class="left">插入column视图在文件中</th>
</tr>


<tr>
<th scope="col" class="left">&#xa0;</th>
<th scope="col" class="left">C-c C-x C-u</th>
<th scope="col" class="left">更新column视图中的值，需要进入表格中执行</th>
</tr>


<tr>
<th scope="col" class="left">&#xa0;</th>
<th scope="col" class="left">C-u C-c C-x C-u</th>
<th scope="col" class="left">更新此文件中所有的column视图内容</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">Property</td>
<td class="left">C-c C-x p</td>
<td class="left">设置一个属性</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-x p COLUMN</td>
<td class="left">设置column，内容可以为%25ITEM 10%ITEM 5%TODO 30%SCEDULE 30%DEADLINE</td>
</tr>
</tbody>
</table>

## Config for File Export HTML Format<a id="sec-1-9" name="sec-1-9"></a>

### Configuration<a id="sec-1-9-1" name="sec-1-9-1"></a>

配置导出org mode为html格式时的配置

    ;;================================================================
    ;; Config for File Export HTML Format
    ;;================================================================ 
    
    ;; Increase default number of headings to export
    (setq org-export-headline-levels 6)
    ;; List of projects
    ;; Work-notes
    
    (setq org-publish-project-alist
    
          ;; (work notes for)
          (quote (("work-notes"
                   :base-directory "~/workspace/github/my-blog/work-notes/"
                   :publishing-directory "~/workspace/github/my-blog/publish-works"
                   :recursive t
                   :table-of-contents t
                   :base-extension "org"
                   :publishing-function org-html-publish-to-html
                   :style-include-default t
                   :section-numbers y
                   :table-of-contents y
                   :author-info y
                   :creator-info y)
                  ("work-notes-extra"
                   :base-directory "~/workspace/github/my-blog/work-notes/"
                   :publishing-directory "~/workspace/github/my-blog/publish-works"
                   :base-extension "css\\|pdf\\|png\\|jpg\\|gif"
                   :publishing-function org-publish-attachment
                   :recursive t
                   :author nil)
                  ("worknotes"
                   :components ("work-notes" "work-notes-extra"))
                  )))
    ;; set parent node into DONE when all sub-tasks are done in org mode
    (defun org-summary-todo (n-done n-not-done)
      "Switch entry to DONE when all subentries are done, to TODO otherwise."
      (let (org-log-done org-log-states)   ; turn off logging
        (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
    
    (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
    
    ;; I'm lazy and don't want to remember the name of the project to publish when I modify
    ;; a file that is part of a project.  So this function saves the file, and publishes
    ;; the project that includes this file
    ;; It's bound to C-S-F12 so I just edit and hit C-S-F12 when I'm done and move on to the next thing
    (defun bh/save-then-publish (&optional force)
      (interactive "P")
      (save-buffer)
      (org-save-all-org-buffers)
      (let (
            )
        (org-publish-current-project force)))

## Config for File Export PDF Format<a id="sec-1-10" name="sec-1-10"></a>

### Configuration<a id="sec-1-10-1" name="sec-1-10-1"></a>

    ;;================================================================
    ;; Config for File Export To PDF 
    ;;================================================================ 
    ;; config for export PDF
    (require 'ox-latex)
    (add-hook 'org-mode-hook
              (lambda () (setq truncate-lines nil)))
    ;;(require 'org-install)
    
    ;; 使用xelatex一步生成PDF
    
    
    (setq org-latex-pdf-process '("xelatex -interaction nonstopmode %f"
                                  "xelatex -interaction nonstopmode %f"))
    ;; code执行免应答（Eval code without confirm）
    (setq org-confirm-babel-evaluate nil)
    
    ;; Auctex
    
    (setq TeX-auto-save t)
    (setq TeX-parse-self t)
    (setq-default TeX-master nil)
    
    (unless (boundp 'org-latex-classes)
      (setq org-latex-classes nil))
    
    (add-to-list 'org-latex-classes
                 '("cn-article"
                   "\\documentclass[10pt,a4paper]{article}
    \\usepackage{graphicx}
    \\usepackage{xcolor}
    
    \\usepackage{lmodern}
    \\usepackage{verbatim}
    \\usepackage{fixltx2e}
    \\usepackage{longtable}
    \\usepackage{float}
    \\usepackage{tikz}
    \\usepackage{wrapfig}
    \\usepackage{soul}
    \\usepackage{textcomp}
    \\usepackage{listings}
    \\usepackage{geometry}
    \\usepackage{algorithm}
    \\usepackage{algorithmic}
    \\usepackage{marvosym}
    \\usepackage{wasysym}
    \\usepackage{latexsym}
    \\usepackage{natbib}
    \\usepackage{fancyhdr}
    %\\usepackage{comment}
    
    \\usepackage{zhfontcfg} % added my own sty file under /usr/local/texlive/texmf-local/tex/latex/local
    
    \\usepackage[xetex,colorlinks=true,CJKbookmarks=true,
    linkcolor=blue,
    urlcolor=blue,
    menucolor=blue]{hyperref}
    \\usepackage{xunicode,xltxtra}
    
    \\hypersetup{unicode=true}
    \\geometry{a4paper, textwidth=6.5in, textheight=10in,
    marginparsep=7pt, marginparwidth=.6in}
    
    \\XeTeXlinebreakskip = 0pt plus 1pt
    
    \\definecolor{foreground}{RGB}{220,220,204}%浅灰
    \\definecolor{background}{RGB}{62,62,62}%浅黑
    \\definecolor{preprocess}{RGB}{250,187,249}%浅紫
    \\definecolor{var}{RGB}{239,224,174}%浅肉色
    \\definecolor{string}{RGB}{154,150,230}%浅紫色
    \\definecolor{type}{RGB}{225,225,116}%浅黄
    \\definecolor{function}{RGB}{140,206,211}%浅天蓝
    \\definecolor{keyword}{RGB}{239,224,174}%浅肉色
    \\definecolor{comment}{RGB}{180,98,4}%深褐色
    \\definecolor{doc}{RGB}{175,215,175}%浅铅绿
    \\definecolor{comdil}{RGB}{111,128,111}%深灰
    \\definecolor{constant}{RGB}{220,162,170}%粉红
    \\definecolor{buildin}{RGB}{127,159,127}%深铅绿
    \\title{}
    \\fancyfoot[C]{\\bfseries\\thepage}
    \\chead{\\MakeUppercase\\sectionmark}
    \\pagestyle{fancy}
    \\tolerance=1000
    [NO-DEFAULT-PACKAGES]
    [NO-PACKAGES]

    
    ;; 使用Listings宏包格式化源代码(只是把代码框用listing环境框起来，还需要额外的设置)
    (setq org-latex-listings t)
    ;; Options for \lset command（reference to listing Manual)
    (setq org-latex-listings-options
          '(
            ("basicstyle" "\\color{foreground}\\small\\mono")           ; 源代码字体样式
            ("keywordstyle" "\\color{function}\\bfseries\\small\\mono") ; 关键词字体样式
            ;;("identifierstyle" "\\color{doc}\\small\\mono")
            ;;("commentstyle" "\\color{comment}\\small\\itshape")         ; 批注样式
            ("stringstyle" "\\color{string}\\small")                    ; 字符串样式
            ("showstringspaces" "false")                                ; 字符串空格显示
            ("numbers" "left")                                          ; 行号显示
            ("numberstyle" "\\color{preprocess}")                       ; 行号样式
            ("stepnumber" "1")                                          ; 行号递增
            ("backgroundcolor" "\\color{background}")                   ; 代码框背景色
            ("tabsize" "4")                                             ; TAB等效空格数
            ("captionpos" "t")                                          ; 标题位置 top or buttom(t|b)
            ("breaklines" "true")                                       ; 自动断行
            ("breakatwhitespace" "true")                                ; 只在空格分行
            ("showspaces" "false")                                      ; 显示空格
            ("columns" "flexible")                                      ; 列样式
            ("frame" "single")                                          ; 代码框：阴影盒
            ("frameround" "tttt")                                       ; 代码框： 圆角
            ("framesep" "0pt")
            ("framerule" "8pt")
            ("rulecolor" "\\color{background}")
            ("fillcolor" "\\color{white}")
            ("rulesepcolor" "\\color{comdil}")
            ("framexleftmargin" "10mm")
            ))
    ;; Make Org use ido-completing-read for most of its completing prompts.
    (setq org-completion-use-ido t)
    ;; 各种Babel语言支持
    (org-babel-do-load-languages
     'org-babel-load-languages
     '((R . t)
       (emacs-lisp . t)
       (matlab . t)
       (C . t)
       (perl . t)
       ;;(objc . t)
       (sh . t)
       (ditaa . t)
       (plantuml . t)
       (org . t)
       (python . t)
       (sh . t)
       (dot . t)
       (haskell . t)
       (dot . t)
       (latex . t)
       (java . t)
       (js . t)
       ))

### <a id="sec-1-10-2" name="sec-1-10-2"></a>

## Config for File Export PDF but use beamer Format<a id="sec-1-11" name="sec-1-11"></a>

### Configuration<a id="sec-1-11-1" name="sec-1-11-1"></a>


# Orgmode table Configuration<a id="sec-2" name="sec-2"></a>

    ;;================================================================
    ;; Config for Org Table, customized some function for operate on cells
    ;;================================================================
    (defun org-table-swap-cells (i1 j1 i2 j2)
      "Swap two cells"
      (let ((c1 (org-table-get i1 j1))
            (c2 (org-table-get i2 j2)))
        (org-table-put i1 j1 c2)
        (org-table-put i2 j2 c1)
        (org-table-align)))
    
    (defun org-table-move-single-cell (direction)
      "Move the current cell in a cardinal direction according to the
      parameter symbol: 'up 'down 'left 'right. Swaps contents of
      adjacent cell with current one."
      (unless (org-at-table-p)
        (error "No table at point"))
      (let ((di 0) (dj 0))
        (cond ((equal direction 'up) (setq di -1))
              ((equal direction 'down) (setq di +1))
              ((equal direction 'left) (setq dj -1))
              ((equal direction 'right) (setq dj +1))
              (t (error "Not a valid direction, must be up down left right")))
        (let* ((i1 (org-table-current-line))
               (j1 (org-table-current-column))
               (i2 (+ i1 di))
               (j2 (+ j1 dj)))
          (org-table-swap-cells i1 j1 i2 j2)
          (org-table-goto-line i2)
          (org-table-goto-column j2))))
    
    (defun org-table-move-single-cell-up ()
      "Move a single cell up in a table; swap with anything in target cell"
      (interactive)
      (org-table-move-single-cell 'up))
    
    (defun org-table-move-single-cell-down ()
      "Move a single cell down in a table; swap with anything in target cell"
      (interactive)
      (org-table-move-single-cell 'down))
    
    (defun org-table-move-single-cell-left ()
      "Move a single cell left in a table; swap with anything in target cell"
      (interactive)
      (org-table-move-single-cell 'left))
    
    (defun org-table-move-single-cell-right ()
      "Move a single cell right in a table; swap with anything in target cell"
      (interactive)
      (org-table-move-single-cell 'right))
    
    (provide 'init-org-table-shift)
    ;; init-org-table-shift.el end here

# Chinese-font-setup<a id="sec-3" name="sec-3"></a>

在Org-mode中，编辑表格并让表格的分隔线对齐是一件不太容易的事情，主要原因是因为Org-mode中编辑时字母与汉字同时存在时，则字母字体长度与汉字字体宽度不同的原因导致，因此这里的主要解决方案是找到一种通用等宽字体，通过字体的配置来达到最终表格对齐正常。
感谢Chinese-font-setup的包开发者：

## Configuration<a id="sec-3-1" name="sec-3-1"></a>

    ;; add font-config for chinese double-width fonts issue
    (use-package chinese-fonts-setup
      :config
      (setq cfs-profiles
            '("program" "org-mode" "read-book"))
    )

## Shot key binding<a id="sec-3-2" name="sec-3-2"></a>

    ;; Reset Increase Font size and Descrease Font size short key binding after using chinese-font-setup plugin
    ;; Reference: https://github.com/tumashu/chinese-fonts-setup
    (global-unset-key (kbd "C-x C-=")) ;; remove original font-resize
    (global-set-key (kbd "C-x C-=") 'cfs-increase-fontsize)
    (global-set-key (kbd "C-x M-=") 'cfs-decrease-fontsize)

# Key bindings for Orgmode<a id="sec-4" name="sec-4"></a>

## Key bindings configurations<a id="sec-4-1" name="sec-4-1"></a>

    ;; -----------------------------------------
    ;;key bindings for org mode
    ;; -----------------------------------------
    
    (global-unset-key (kbd "C-'")) ;; this setting has no use, and conflict with smart
    
    
    ;;(global-set-key (kbd "<f12>") 'org-agenda) ;; configured blew
    (global-set-key (kbd "<f9> c") 'calendar)
    (global-set-key (kbd "<f9> v") 'visible-mode)
    (global-set-key (kbd "C-c c") 'org-capture)
    
    ;; add ~/notes/front-end-dev-plan.org into agenda
    ;; (setq org-agenda-files (list "~/notes/front-end-dev-plan.org"))
    (global-set-key "\C-c a" 'org-agenda)
    ;; I use C-c c to start capture mode
    (global-set-key (kbd "C-c c") 'org-capture)
    
    
    ;; config for export-mutilpul files
    (global-set-key (kbd "C-<f12>") 'bh/save-then-publish)
    
    ;; config for clocking
    (global-set-key (kbd "<f9> I") 'bh/punch-in)
    (global-set-key (kbd "<f9> O") 'bh/punch-out)
    
    (global-set-key (kbd "<f9> l") 'org-toggle-link-display)
    (global-set-key (kbd "<f9> SPC") 'bh/clock-in-last-task)
    
    (global-set-key (kbd "<f11>") 'org-clock-goto)
    (global-set-key (kbd "C-<f11>") 'org-clock-in)

## Key binding for org-mode<a id="sec-4-2" name="sec-4-2"></a>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">
<caption class="t-above"><span class="table-number">Table 1:</span> Org-mode快捷键</caption>

<colgroup>
<col  class="left" />

<col  class="left" />

<col  class="left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">分类</th>
<th scope="col" class="left">快捷键</th>
<th scope="col" class="left">说明</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">org-mode</td>
<td class="left">C-RET</td>
<td class="left">加入同级别索引</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-RET</td>
<td class="left">加入同级别的列表</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-t</td>
<td class="left">设置TODO标签</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-left/M-right</td>
<td class="left">修改任务等级，子任务不跟着变化</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-S-up/down</td>
<td class="left">调整此任务节点等级，子任务跟着变化</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c -</td>
<td class="left">更换列表标记(循环)</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-S-RET</td>
<td class="left">新增一个子项</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-up/M-down</td>
<td class="left">调整此任务节点的顺序</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c b</td>
<td class="left">只编辑当前级别列表</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">outline</td>
<td class="left">C-c C-p</td>
<td class="left">上一个标题</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-n</td>
<td class="left">下一下</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-f</td>
<td class="left">同一级的上一个</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-b</td>
<td class="left">同一级的下一个</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-u</td>
<td class="left">回到上一级标题</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-j</td>
<td class="left">跳转标题</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">column</td>
<td class="left">C-c C-x C-c</td>
<td class="left">打开column视图模式</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">r</td>
<td class="left">刷新</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">q</td>
<td class="left">退出</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left"><left> <right> <up> <down></td>
<td class="left">视图之间跳转</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">v</td>
<td class="left">查看属性完整值</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-x i</td>
<td class="left">插入column视图在文件中</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-x C-u</td>
<td class="left">更新column视图中的值，需要进入表格中执行</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-u C-c C-x C-u</td>
<td class="left">更新此文件中所有的column视图内容</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Property</td>
<td class="left">C-c C-x p</td>
<td class="left">设置一个属性</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-x p COLUMN</td>
<td class="left">设置column，内容可以为%25ITEM 10%ITEM 5%TODO 30%SCEDULE 30%DEADLINE</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Tags</td>
<td class="left">C-c C-c C-c</td>
<td class="left">打开tag选择窗口，然后通过字母索引选择tag</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">SPC</td>
<td class="left">清除所有tag</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-c</td>
<td class="left">可以直接输入tag的单词直接进行选择</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-x C-c</td>
<td class="left">打开列展示视图</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">q</td>
<td class="left">退出列视图</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Planning</td>
<td class="left">C-c .</td>
<td class="left">设置时间</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">S-left/S-right</td>
<td class="left">在日历中选择时间</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-n/M-p</td>
<td class="left">设置任务的优先级</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-s</td>
<td class="left">设置任务开始时间, schedlued</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-d</td>
<td class="left">设置任务结束时间，deadline</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c / d</td>
<td class="left">显示警告天数之内的Deadline任务</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-u C-c / d</td>
<td class="left">显示所有的deadline任务</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-1 C-c / d</td>
<td class="left">查看一天之内接近的deadline任务列表</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c / b</td>
<td class="left">查看指定日期之前的deadline, schedule任务列表</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c / a</td>
<td class="left">查看指定日期之后的deadline, schedule任务列表</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c .</td>
<td class="left">插入时间(Timestamps)</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">S-left/right</td>
<td class="left">光标在时间上时，用于往前一天往后一天调整</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Clocking</td>
<td class="left">C-c C-x C-i</td>
<td class="left">开始clock</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-x C-o</td>
<td class="left">退出clock</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-x C-r</td>
<td class="left">插入clock table</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-x ;</td>
<td class="left">Start a count down time</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Agenda</td>
<td class="left">C-c a</td>
<td class="left">打开agenda view, 然后根据显示视图进行选择性显示</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c [</td>
<td class="left">添加当前文件进入agenda-view-file中</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c ]</td>
<td class="left">删除当前文件从agenda-view-file中</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-x <</td>
<td class="left">强制限制只使用当前文件或当前节点来显示agenda-view</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-x ></td>
<td class="left">取消以上限制</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c a t</td>
<td class="left">显示TODO列表</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c a T</td>
<td class="left">可以指定要显示的状态列表，多个状态使用"竖线"隔开显示</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c a m</td>
<td class="left">匹配 tags and properties</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c a M</td>
<td class="left">匹配搜索的tag</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c a L</td>
<td class="left">采用timeline的方式显示此项目，只能在一个单文件上执行此操作</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c a s</td>
<td class="left">按搜索关键查询</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c a #</td>
<td class="left">列出项目暂停的任务</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-w</td>
<td class="left">导出文件</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Agenda column</td>
<td class="left">C-c C-x C-c</td>
<td class="left">打开column模式在agenda view中</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Capture</td>
<td class="left">C-c c</td>
<td class="left">打开capture</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Export</td>
<td class="left">C-<f12></td>
<td class="left">一次性生成所有目录的org文件为html文件，发布配置见.emacs.d中的配置目录</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-e</td>
<td class="left">导出</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Tables</td>
<td class="left">C-c 竖线</td>
<td class="left">插入表格</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c -</td>
<td class="left">在下面添加水平线</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c RET</td>
<td class="left">添加水平线并跳转到下一行</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-m</td>
<td class="left">在本列下面添加一行</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-S-Right</td>
<td class="left">在本列后面添加一列</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-S-Down</td>
<td class="left">在本行上面添加一行</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-S-Left</td>
<td class="left">删除本列</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-S-UP</td>
<td class="left">删除本行</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-left/right</td>
<td class="left">移动列</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-Up/Down</td>
<td class="left">移动行</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-c</td>
<td class="left">重新定义表格</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c \`</td>
<td class="left">修改隐藏的表格中的内容</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">TAB</td>
<td class="left">跳转下一个单元格</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-a / S-tab</td>
<td class="left">跳转到上一个单元格</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c SPAC</td>
<td class="left">清除当前单元格内容</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Aligns</td>
<td class="left">M-x cfs-switch-profile</td>
<td class="left">修改一下当前buffer使用的字体profile，表格对齐需要按中英文字体宽度相同配置</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-x cfs-edit-profile</td>
<td class="left">修改当前profile的配置，可以在修改字体和大小后，在对应的字体大小行上，执行C-c C-c测试</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-x cfs-increase-fontsize</td>
<td class="left">放大字体，按等宽方式放大，已经绑定快捷键C-x C-=</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-x cfs-decrease-fontsize</td>
<td class="left">缩小字体，按等宽方式缩小，已经绑定快捷键C-x M-=</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Archive</td>
<td class="left">C-c C-x a</td>
<td class="left">内部归档，将本任务下的所有子任务标识为灰色，默认将是不可打开的状态，可以通过C-TAB进行打开</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-TAB</td>
<td class="left">打开内部归档后的任务</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-x A</td>
<td class="left">将此任务迁移入一个名为"Archive"的标记条下</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-x C-a</td>
<td class="left">将此任务迁移到与当前文件名相同名称+<sub>archive的文件中</sub></td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-x C-s</td>
<td class="left">同上</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Refile</td>
<td class="left">C-c C-w</td>
<td class="left">将此标签任务迁移到其它文件中</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c M-w</td>
<td class="left">同上，并保留当前文件内容</td>
</tr>


<tr>
<td class="left">Helm-org</td>
<td class="left">C-x c i</td>
<td class="left">显示当前文件中所有的headings，支持搜索和切换</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>
</tbody>
</table>

## Orgmode keybindings from orginal ormode.org<a id="sec-4-3" name="sec-4-3"></a>

`==============================================================================`
Org-Mode Reference Card (for version 7.8.11)
`==============================================================================`

`==============================================================================`
Getting Started
`==============================================================================`
To read the on-line documentation try             M-x org-info

`==============================================================================`
Visibility Cycling
`==============================================================================`

rotate current subtree between states             TAB
rotate entire buffer between states               S-TAB
restore property-dependent startup visibility     C-u C-u TAB
show the whole file, including drawers            C-u C-u C-u TAB
reveal context around point                       C-c C-r

`==============================================================================`
Motion
`==============================================================================`

next/previous heading                             C-c C-n/p
next/previous heading, same level                 C-c C-f/b
backward to higher level heading                  C-c C-u
jump to another place in document                 C-c C-j
previous/next plain list item                     S-UP/DOWN\notetwo

`==============================================================================`
Structure Editing
`==============================================================================`

insert new heading/item at current level          M-RET
insert new heading after subtree                  C-RET
insert new TODO entry/checkbox item               M-S-RET
insert TODO entry/ckbx after subtree              C-S-RET
turn (head)line into item, cycle item type        C-c -
turn item/line into headline                      C-c \*
promote/demote heading                            M-LEFT/RIGHT
promote/demote current subtree                    M-S-LEFT/RIGHT
move subtree/list item up/down                    M-S-UP/DOWN
sort subtree/region/plain-list                    C-c ^
clone a subtree                                   C-c C-x c
copy visible text                                 C-c C-x v
kill/copy subtree                                 C-c C-x C-w/M-w
yank subtree                                      C-c C-x C-y or C-y
narrow buffer to subtree / widen                  C-x n s/w

`==============================================================================`
Capture - Refile - Archiving
`==============================================================================`
capture a new item (C-u C-u = goto last)          c-c c \noteone
refile subtree (C-u C-u = goto last)              C-c C-w
archive subtree using the default command         C-c C-x C-a
move subtree to archive file                      C-c C-x C-s
toggle ARCHIVE tag / to ARCHIVE sibling           C-c C-x a/A
force cycling of an ARCHIVEd tree                 C-TAB

`==============================================================================`
Filtering and Sparse Trees
`==============================================================================`

construct a sparse tree by various criteria       C-c /
view TODO's in sparse tree                        C-c / t/T
global TODO list in agenda mode                   C-c a t \noteone
time sorted view of current org file              C-c a L

`==============================================================================`
Tables
`==============================================================================`

---

Creating a table

---

just start typing, e.g.                           |Name|Phone|Age RET |- TAB
convert region to table                           C-c |
&#x2026; separator at least 3 spaces                   C-3 C-c |

---

Commands available inside tables

---

The following commands work when the cursor is inside a table.
outside of tables, the same keys may have other functionality.

---

Re-aligning and field motion

---

re-align the table without moving the cursor      C-c C-c
re-align the table, move to next field            TAB
move to previous field                            S-TAB
re-align the table, move to next row              RET
move to beginning/end of field                    M-a/e

---

Row and column editing

---

move the current column left                      M-LEFT/RIGHT
kill the current column                           M-S-LEFT
insert new column to left of cursor position      M-S-RIGHT

move the current row up/down                      M-UP/DOWN
kill the current row or horizontal line           M-S-UP
insert new row above the current row              M-S-DOWN
insert hline below (C-u : above) current row      C-c -
insert hline and move to line below it            C-c RET
sort lines in region                              C-c ^

---

Regions

---

cut/copy/paste rectangular region                 C-c C-x C-w/M-w/C-y
fill paragraph across selected cells              C-c C-q

---

Miscellaneous

---

to limit column width to N characters, use        &#x2026;| <N> |&#x2026;
edit the current field in a separate window       C-c \`
make current field fully visible                  C-u TAB
export as tab-separated file                      M-x org-table-export
import tab-separated file                         M-x org-table-import
sum numbers in current column/rectangle           C-c +

---

Tables created with the table.el package

---

insert a new table.el table                       C-c ~
recognize existing table.el table                 C-c C-c
convert table (Org-mode <-> table.el)             C-c ~

---

Spreadsheet

---

Formulas typed in field are executed by TAB,
RET and C-c C-c.  = introduces a column
formula, := a field formula.

Example: Add Col1 and Col2                        |=$1+$2      |
&#x2026; with printf format specification              |=$1+$2;%.2f|
&#x2026; with constants from constants.el              |=$1/$c/$cm |
sum from 2nd to 3rd hline                         |:=vsum(@II..@III)|
apply current column formula                      | = |

set and eval column formula                       C-c =
set and eval field formula                        C-u C-c =
re-apply all stored equations to current line     C-c \*
re-apply all stored equations to entire table     C-u C-c \*
iterate table to stability                        C-u C-u C-c \*
rotate calculation mark through # \* ! ^ \_ $       C-#
show line, column, formula reference              C-c ?
toggle grid / debugger                            C-c }/{

---

Formula Editor

---

edit formulas in separate buffer                  C-c '
exit and install new formulas                     C-c C-c
exit, install, and apply new formulas             C-u C-c C-c
abort                                             C-c C-q
toggle reference style                            C-c C-r
pretty-print Lisp formula                         TAB
complete Lisp symbol                              M-TAB
shift reference point                             S-cursor
shift test line for column references             M-up/down
scroll the window showing the table               M-S-up/down
toggle table coordinate grid                      C-c }

`==============================================================================`
Links
`==============================================================================`

globally store link to the current location       C-c l \noteone
insert a link (TAB completes stored links)        C-c C-l
insert file link with file name completion        C-u C-c C-l
edit (also hidden part of) link at point          C-c C-l

open file links in emacs                          C-c C-o
&#x2026;force open in emacs/other window               C-u C-c C-o
open link at point                                mouse-1/2
&#x2026;force open in emacs/other window               mouse-3
record a position in mark ring                    C-c %
jump back to last followed link(s)                C-c &
find next link                                    C-c C-x C-n
find previous link                                C-c C-x C-p
edit code snippet of file at point                C-c '
toggle inline display of linked images            C-c C-x C-v

`==============================================================================`
Working with Code (Babel)
`==============================================================================`

execute code block at point                       C-c C-c
open results of code block at point               C-c C-o
check code block at point for errors              C-c C-v c
insert a header argument with completion          C-c C-v j
view expanded body of code block at point         C-c C-v v
view information about code block at point        C-c C-v I
go to named code block                            C-c C-v g
go to named result                                C-c C-v r
go to the head of the current code block          C-c C-v u
go to the next code block                         C-c C-v n
go to the previous code block                     C-c C-v p
demarcate a code block                            C-c C-v d
execute the next key sequence in the code edit bu C-c C-v x
execute all code blocks in current buffer         C-c C-v b
execute all code blocks in current subtree        C-c C-v s
tangle code blocks in current file                C-c C-v t
tangle code blocks in supplied file               C-c C-v f
ingest all code blocks in supplied file into the  C-c C-v i
switch to the session of the current code block   C-c C-v z
load the current code block into a session        C-c C-v l
view sha1 hash of the current code block          C-c C-v a

`==============================================================================`
Completion
`==============================================================================`

In-buffer completion completes TODO keywords at headline start, TeX
macros after \`\\', option keywords after \`#-', TAGS
after  \`:', and dictionary words elsewhere.

complete word at point                            M-TAB

`==============================================================================`
TODO Items and Checkboxes
`==============================================================================`

rotate the state of the current item              C-c C-t
select next/previous state                        S-LEFT/RIGHT
select next/previous set                          C-S-LEFT/RIGHT
toggle ORDERED property                           C-c C-x o
view TODO items in a sparse tree                  C-c C-v
view 3rd TODO keyword's sparse tree               C-3 C-c C-v

set the priority of the current item              C-c , [ABC]
remove priority cookie from current item          C-c , SPC
raise/lower priority of current item              S-UP/DOWN\notetwo

insert new checkbox item in plain list            M-S-RET
toggle checkbox(es) in region/entry/at point      C-c C-x C-b
toggle checkbox at point                          C-c C-c
update checkbox statistics (C-u : whole file)     C-c #

`==============================================================================`
Tags
`==============================================================================`

set tags for current heading                      C-c C-q
realign tags in all headings                      C-u C-c C-q
create sparse tree with matching tags             C-c   
globally (agenda) match tags at cursor            C-c C-o

`==============================================================================`
Properties and Column View
`==============================================================================`

set property/effort                               C-c C-x p/e
special commands in property lines                C-c C-c
next/previous allowed value                       S-left/right
turn on column view                               C-c C-x C-c
capture columns view in dynamic block             C-c C-x i

quit column view                                  q
show full value                                   v
edit value                                        e
next/previous allowed value                       n/p or S-left/right
edit allowed values list                          a
make column wider/narrower                        > / <
move column left/right                            M-left/right
add new column                                    M-S-right
Delete current column                             M-S-left

`==============================================================================`
Timestamps
`==============================================================================`

prompt for date and insert timestamp              C-c .
like C-c . but insert date and time format        C-u C-c .
like C-c . but make stamp inactive                C-c !
insert DEADLINE timestamp                         C-c C-d
insert SCHEDULED timestamp                        C-c C-s
create sparse tree with all deadlines due         C-c / d
the time between 2 dates in a time range          C-c C-y
change timestamp at cursor Â±1 day                S-RIGHT/LEFT\notetwo
change year/month/day at cursor by Â±1            S-UP/DOWN\notetwo
access the calendar for the current date          C-c >
insert timestamp matching date in calendar        C-c <
access agenda for current date                    C-c C-o
select date while prompted                        mouse-1/RET
toggle custom format display for dates/times      C-c C-x C-t

---

Clocking time

---

start clock on current item                       C-c C-x C-i
stop/cancel clock on current item                 C-c C-x C-o/x
display total subtree times                       C-c C-x C-d
remove displayed times                            C-c C-c
insert/update table with clock report             C-c C-x C-r

`==============================================================================`
Agenda Views
`==============================================================================`

add/move current file to front of agenda          C-c [
remove current file from your agenda              C-c ]
cycle through agenda file list                    C-'
set/remove restriction lock                       C-c C-x </>

compile agenda for the current week               C-c a a \noteone
compile global TODO list                          C-c a t \noteone
compile TODO list for specific keyword            C-c a T \noteone
match tags, TODO kwds, properties                 C-c a m \noteone
match only in TODO entries                        C-c a M \noteone
find stuck projects                               C-c a # \noteone
show timeline of current org file                 C-c a L \noteone
configure custom commands                         C-c a C \noteone
agenda for date at cursor                         C-c C-o

---

Commands available in an agenda buffer

---

---

View Org file

---

show original location of item                    SPC/mouse-3
show and recenter window                          L
goto original location in other window            TAB/mouse-2
goto original location, delete other windows      RET
show subtree in indirect buffer, ded.\\ frame      C-c C-x b
toggle follow-mode                                F

---

Change display

---

delete other windows                              o
view mode dispatcher                              v
switch to day/week/month/year/def view            d w vm vy vSP
toggle diary entries / time grid / habits         D / G / K
toggle entry text / clock report                  E / R
toggle display of logbook entries                 l / v l/L/c
toggle inclusion of archived trees/files          v a/A
refresh agenda buffer with any changes            r / g
filter with respect to a tag                      /
save all org-mode buffers                         s
display next/previous day,week,&#x2026;                f / b
goto today / some date (prompt)                   . / j

---

Remote editing

---

digit argument                                    0-9
change state of current TODO item                 t
kill item and source                              C-k
archive default                                   $ / a
refile the subtree                                C-c C-w
set/show tags of current headline                 : / T
set effort property (prefix=nth)                  e
set / compute priority of current item            , / P
raise/lower priority of current item              S-UP/DOWN\notetwo
run an attachment command                         C-c C-a
schedule/set deadline for this item               C-c C-s/d
change timestamp one day earlier/later            S-LEFT/RIGHT\notetwo
change timestamp to today                         >
insert new entry into diary                       i
start/stop/cancel the clock on current item       I / O / X
jump to running clock entry                       J
mark / unmark / execute bulk action               m / u / B

---

Misc

---

follow one or offer all links in current entry    C-c C-o

---

Calendar commands

---

find agenda cursor date in calendar               c
compute agenda for calendar cursor date           c
show phases of the moon                           M
show sunrise/sunset times                         S
show holidays                                     H
convert date to other calendars                   C

---

Quit and Exit

---

quit agenda, remove agenda buffer                 q
exit agenda, remove all agenda buffers            x

`==============================================================================`
LaTeX and cdlatex-mode
`==============================================================================`

preview LaTeX fragment                            C-c C-x C-l
expand abbreviation (cdlatex-mode)                TAB
insert/modify math symbol (cdlatex-mode)          \` / '
insert citation using RefTeX                      C-c C-x [

`==============================================================================`
Exporting and Publishing
`==============================================================================`

Exporting creates files with extensions .txt and .html
in the current directory.  Publishing puts the resulting file into
some other place.

export/publish dispatcher                         C-c C-e

export visible part only                          C-c C-e v
insert template of export options                 C-c C-e t
toggle fixed width for entry or region            C-c :
toggle pretty display of scripts, entities        C-c C-x {\tt\char\`\\}

---

Comments: Text not being exported

---

Lines starting with # and subtrees starting with COMMENT are
never exported.

toggle COMMENT keyword on entry                   C-c ;

`==============================================================================`
Dynamic Blocks
`==============================================================================`

update dynamic block at point                     C-c C-x C-u
update all dynamic blocks                         C-u C-c C-x C-u

`==============================================================================`
Notes
`==============================================================================`

# Org文件批量管理<a id="sec-5" name="sec-5"></a>

# End of file<a id="sec-6" name="sec-6"></a>

    (provide 'init-org-mode)
    ;; init-org-mode.el end here
