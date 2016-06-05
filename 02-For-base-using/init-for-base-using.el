
;; mark the start time
(defconst emacs-start-time (current-time))

(setq user-full-name "Lu Jianmei"
      user-mail-address "lu.jianmei@trs.com.cn"
)

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

;; Nobody likes to have to type out the full yes or no when Emacs asks. Which it does often. Make it one character.
  (defalias 'yes-or-no-p 'y-or-n-p)

  ;;
  (setq echo-keystrokes 0.1
        use-dialog-box nil
        visible-bell t)
  (show-paren-mode t)

  ;; Turn on column numbers.
  (column-number-mode)

  ;; Deal with temporary files. I don't care about them and this makes them go away.
  (setq backup-directory-alist `((".*" . ,temporary-file-directory)))
  (setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;;----------------------------------------------------------------------------
;; Some basic preferences
;;----------------------------------------------------------------------------
(setq-default
 blink-cursor-interval 0.4
 bookmark-default-file (expand-file-name ".bookmarks.el" user-emacs-directory)
 buffers-menu-max-size 30
 case-fold-search t
 column-number-mode t
 delete-selection-mode t
 ediff-split-window-function 'split-window-horizontally
 ediff-window-setup-function 'ediff-setup-windows-plain
 indent-tabs-mode nil
 make-backup-files nil
 mouse-yank-at-point t
 save-interprogram-paste-before-kill t
 scroll-preserve-screen-position 'always
 set-mark-command-repeat-pop t
 tooltip-delay 1.5
 truncate-lines nil
 truncate-partial-width-windows nil)


(global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose nil)

(transient-mark-mode t)

;; Handy way of getting back to previous places.
(bind-key "C-x p" 'pop-to-mark-command)
(setq set-mark-command-repeat-pop t)

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


