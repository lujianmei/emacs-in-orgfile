
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
