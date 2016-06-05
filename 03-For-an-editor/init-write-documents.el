
;; Turn on auto complete.
;;  (require 'auto-complete-config)       
  ;;(ac-config-default)

(use-package company
  :defer t
  :config (add-hook 'prog-mode-hook 'company-mode))

(use-package dash
  :defer t)

;;(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq backup-directory-alist '(("." . (expand-file-name "backups" user-emacs-directory))))

(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))
;;(setq auto-save-file-name-transforms '((".*" (expand-file-name "auto-save-list" user-emacs-directory) t)))

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

;; load my own org-mode configuration from init-org-mode.el
  (starter-kit-load "03-For-an-editor/init-org-mode.org")
;;(require 'init-org-mode)
;;(load-library "init-org-mode")

;; load my own org-mode configuration from init-org-agenda-view.el
  (starter-kit-load "03-For-an-editor/init-org-agenda-view.org")
;;(require 'init-org-agenda-view)
;;(load-library "init-org-agenda-view")

;; load my own org-mode configuration from init-org-table-shift.el
   (starter-kit-load "03-For-an-editor/init-org-table-shift.org")
;;(require 'init-org-table-shift)
;;(load-library "init-org-table-shift")

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



;; load my own markdown mode configuration from init-markdown-mode.el
;;(require 'init-markdown-mode)
  (starter-kit-load "03-For-an-editor/init-markdown-mode.org")

;; setting for tramp
(setq tramp-default-method "ssh")

;; config for caching password for 36000s
(setq password-cache-expiry 36000)

(use-package winner
  :defer t)

(use-package smart-mode-line
  :defer t)

(use-package undo-tree
  :defer t
  :diminish undo-tree-mode
  :config
  (progn
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-diff t)))

(use-package guide-key
  :defer t
  :diminish guide-key-mode
  :config
  (progn
  (setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-c"))
  (guide-key-mode 1)))  ; Enable guide-key-mode

(prefer-coding-system 'utf-8)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))

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

(use-package avy
  :defer t)
  ;; I use the jj key-chord for this; see the definitions for key-chord
(use-package avy-zap
  :defer t
  :bind
  (("M-z" . avy-zap-up-to-char-dwim)
   ("M-Z" . avy-zap-to-char-dwim)))

(use-package ace-isearch
  :config
  (progn
    (global-ace-isearch-mode +1) ;; start this for global
    ;;(setq ace-isearch-funtion-from-isearch 'swoop-from-isearch) ; need to install swoop
    ;;(define-key swoop-map (kbd "C-s") 'swoop-action-goto-line-next)
    ;;(define-key swoop-map (kbd "C-r") 'swoop-action-goto-line-prev)
    (setq ace-isearch-funtion-from-isearch 'helm-swoop-from-isearch)
    ;; (setq ace-isearch-funtion-from-isearch 'helm-occur-from-isearch) ; alternative way

    ;; blew configuration can be support for Chinese
    (defadvice ace-jump-char-category (around adv-ace-jump-support-umlauts activate)
      (unless (= (char-syntax (ad-get-arg 0)) ?w)
        ad-do-it)
      (setq ad-return-value 'alpha))

    ;; base configuration 
    (custom-set-variables
     '(ace-isearch-input-length 6)
     '(ace-isearch-jump-delay 0.25)
     '(ace-isearch-function 'ace-jump-word-mode)
     ;;'(ace-isearch-function 'avy-goto-char)
     '(ace-isearch-use-jump 'printing-char))
    (define-key isearch-mode-map (kbd "C-'") 'ace-isearch-jump-during-isearch)
    )
)

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

(use-package projectile
  ;; :defer t
  :diminish projectile-mode
  :config
  (progn
    (setq projectile-keymap-prefix (kbd "C-c p"))
    (setq projectile-completion-system 'default)
    (setq projectile-enable-caching t)
    (setq projectile-indexing-method 'alien)
    (add-to-list 'projectile-globally-ignored-files "node-modules")
    ;; setting for projectile
    (setq projectile-other-file-alist '(("cpp" "h" "hpp" "ipp")
                                        ("ipp" "h" "hpp" "cpp")
                                        ("hpp" "h" "ipp" "cpp")
                                        ("cxx" "hxx" "ixx")
                                        ("ixx" "cxx" "hxx")
                                        ("hxx" "ixx" "cxx")
                                        ("c" "h")
                                        ("m" "h")
                                        ("mm" "h")
                                        ("h" "c" "cpp" "ipp" "hpp" "m" "mm")
                                        ("cc" "hh")
                                        ("hh" "cc")
                                        ("vert" "frag")
                                        ("frag" "vert")
                                        (nil "lock" "gpg")
                                        ("lock" "")
                                        ("gpg" "")
                                        ("js" "css" "html")))

    (add-to-list 'projectile-other-file-alist '("css" "js")) ;; switch from css -> js
    (add-to-list 'projectile-other-file-alist '("js" "css")) ;; switch from js -> css


    ;; setting for helm-projectile

    ;;(setq projectile-switch-project-action 'helm-projectile-find-file)
    (setq projectile-switch-project-action 'helm-projectile)

    )



  :config
  (projectile-global-mode))


(use-package helm-projectile
  :defer t
  :init
  (setq helm-projectile-fuzzy-match t)
  )

;; -----------------------------------------
;; helm-project
;; -----------------------------------------
(global-set-key (kbd "C-c h") 'helm-projectile)
  ;; Grep in a projectile
  (global-set-key (kbd "C-c p s g") 'helm-projectile-grep)

;; add font-config for chinese double-width fonts issue
(use-package chinese-fonts-setup
  :config
  (setq cfs-profiles
        '("program" "org-mode" "read-book"))
)

;; Reset Increase Font size and Descrease Font size short key binding after using chinese-font-setup plugin
;; Reference: https://github.com/tumashu/chinese-fonts-setup
(global-unset-key (kbd "C-x C-=")) ;; remove original font-resize
(global-set-key (kbd "C-x C-=") 'cfs-increase-fontsize)
(global-set-key (kbd "C-x M-=") 'cfs-decrease-fontsize)

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

(use-package expand-region
  :config
  ;; Don't use expand-region fast keys
  (setq expand-region-fast-keys-enabled nil)

  ;; Show expand-region command used
  (setq er--show-expansion-message t)

  )

;; Expand region (increases selected region by semantic units)
(global-set-key (kbd "C-'") 'er/expand-region)

;; add smart swap buffers in multi-windows
(use-package swap-buffers
  :config
  (global-set-key (kbd "C-x 5") 'swap-buffers)
)

;; load my mu4e configuration from init-mu4e.el
;;(require 'init-mu4e)
  (starter-kit-load "03-For-an-editor/init-mu4e.org")


;;(load-library "init-mu4e")

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

;; add multi cursors:
;;(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-set-key (kbd "C-S-c C-e") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C-S-c C-a") 'mc/edit-beginnings-of-lines)

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

;; -----------------------------------------
;; start tabbar-mode
;; -----------------------------------------
(global-set-key (kbd "C-c t") 'tabbar-mode)
;; Tabbar, following is default key binding, no need to set again
;;(global-set-key (kbd "C-c <C-left>") 'tabbar-forward-tab)
;;(global-set-key (kbd "C-c <C-right>") 'tabbar-backward-tab)
;;(global-set-key (kbd "C-c <C-up>") 'tabbar-forward-group)
;;(global-set-key (kbd "C-c <C-down>") 'tabbar-backward-group)

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

;; Use C-f during file selection to switch to regular find-file
(ido-mode t)
;;(ido-everywhere t)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point nil)
(setq ido-auto-merge-work-directories-length 0)
(setq ido-use-virtual-buffers t)

(use-package mmm-mode
  :config
  ;;(require 'mmm-auto)
  (setq mmm-global-mode 'buffers-with-submode-classes)
  (setq mmm-submode-decoration-level 2)
  
  )
