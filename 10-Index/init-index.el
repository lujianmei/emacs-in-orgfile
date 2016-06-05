
;; I don't need to kill emacs that easily
;; the mnemonic is C-x REALLY QUIT
(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
;;(global-set-key (kbd "C-x C-c") 'delete-frame)
;; unset the original kill emacs key binding
(global-unset-key (kbd "C-x C-c"))

;; Make more windows operations more convenient
(global-set-key (kbd "C-x M-z") 'suspend-frame)
(global-set-key (kbd "C-x C-m") 'toggle-frame-maximized) ;; already have C-x RET



;; Create new frame
(define-key global-map (kbd "C-x C-n") 'make-frame-command)


;; Window switching
(windmove-default-keybindings) ;; Shift+direction
(global-set-key (kbd "C-x -") 'toggle-window-split)
(global-set-key (kbd "C-x C--") 'rotate-windows)
;;(global-unset-key (kbd "C-x C-+")) ;; don't zoom like this



;; Reset Increase Font size and Descrease Font size short key binding after using chinese-font-setup plugin
;; Reference: https://github.com/tumashu/chinese-fonts-setup
(global-unset-key (kbd "C-x C-=")) ;; remove original font-resize
(global-set-key (kbd "C-x C-=") 'cfs-increase-fontsize)
(global-set-key (kbd "C-x M-=") 'cfs-decrease-fontsize)

;; split window
(global-set-key (kbd "C-x 3") 'split-window-right-and-move-there-dammit)


;; Create scratch buffer
(global-set-key (kbd "C-c b") 'create-scratch-buffer)

;; Move windows, even in org-mode
(global-set-key (kbd "<s-right>") 'windmove-right)
(global-set-key (kbd "<s-left>") 'windmove-left)
(global-set-key (kbd "<s-up>") 'windmove-up)
(global-set-key (kbd "<s-down>") 'windmove-down)

;; -----------------------------------------
;; enlarge current window
;; -----------------------------------------
(global-set-key (kbd "M-[") 'enlarge-window-horizontally)
(global-set-key (kbd "M-]") 'shrink-window-horizontally)

;; Move more quickly
(global-set-key (kbd "C-S-n") (λ (ignore-errors (next-line 5))))
(global-set-key (kbd "C-S-p") (λ (ignore-errors (previous-line 5))))
(global-set-key (kbd "C-S-f") (λ (ignore-errors (forward-char 5))))
(global-set-key (kbd "C-S-b") (λ (ignore-errors (backward-char 5))))


;; M-i for back-to-indentation
(global-set-key (kbd "M-i") 'back-to-indentation)


(global-set-key (kbd "<prior>") 'beginning-of-buffer)
(global-set-key (kbd "<home>") 'beginning-of-buffer)
(global-set-key (kbd "<next>") 'end-of-buffer)
(global-set-key (kbd "<end>") 'end-of-buffer)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)

(global-set-key (kbd "M-<up>") 'smart-up)
(global-set-key (kbd "M-<down>") 'smart-down)
(global-set-key (kbd "M-<left>") 'smart-backward)
(global-set-key (kbd "M-<right>") 'smart-forward)


;; Convenience on ThinkPad Keyboard: Use back/forward as pg up/down
(global-set-key (kbd "<XF86Back>") 'scroll-down)
(global-set-key (kbd "<XF86Forward>") 'scroll-up)
(global-set-key (kbd "<XF86WakeUp>") 'beginning-of-buffer)

(defun copy-to-end-of-line ()
    (interactive)
    (kill-ring-save (point)
                    (line-end-position))
    (message "Copied to end of line")
    )

  (defun copy-whole-lines (arg)
    "Copy lines in the kill ring, whole line"
    (interactive "p")
    (kill-ring-save (line-begining-position)
                    (line-begining-position (+ 1 arg)))
    (message "%d line%s copied" arg (if (=1 arg) "" "s"))
    )

  (defun copy-line (arg)
    "Copy to end of line, or as many lines as prefix argument"
    (interactive "P")
    (if (null arg)
        (copy-to-end-of-line)
      (copy-whole-lines (prefix-numeric-value arg))
      )
    )

  (defun save-region-or-current-line (arg)
    (interactive "P")
    (if (region-active-p)
        (kill-ring-save (region-beginning) (region-end))
      (copy-line arg)))

  ;; copy region or current line
  (global-set-key (kbd "M-w") 'save-region-or-current-line)
  (global-set-key (kbd "M-c") 'save-region-or-current-line)
  (global-set-key (kbd "s-w") 'save-region-or-current-line)



;; Use shell-like backspace C-h, rebind help to F1
(define-key key-translation-map [?\C-h] [?\C-?])
(global-set-key (kbd "<f1>") 'help-command)

(global-set-key (kbd "M-h") 'kill-region-or-backward-word)

;; Transpose stuff with M-t
(global-unset-key (kbd "M-t")) ;; which used to be transpose-words
(global-set-key (kbd "M-t l") 'transpose-lines)
(global-set-key (kbd "M-t w") 'transpose-words)
(global-set-key (kbd "M-t s") 'transpose-sexps)
(global-set-key (kbd "M-t p") 'transpose-params)



;; Perform general cleanup.
(global-set-key (kbd "C-c n") 'cleanup-buffer)
(global-set-key (kbd "C-c C-n") 'cleanup-buffer)
(global-set-key (kbd "C-c C-<return>") 'delete-blank-lines)


;; Edit file with sudo
(global-set-key (kbd "M-s e") 'sudo-edit)


;; Copy file path to kill ring
(global-set-key (kbd "C-x M-w") 'copy-current-file-path)


;; Comment/uncomment block
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)


;; Clever newlines
(global-set-key (kbd "C-o") 'open-line-and-indent)
(global-set-key (kbd "<C-return>") 'open-line-below)
(global-set-key (kbd "<C-S-return>") 'open-line-above)
(global-set-key (kbd "<M-return>") 'new-line-dwim)

;; Duplicate region
(global-set-key (kbd "C-c d") 'duplicate-current-line-or-region)

;; Line movement
(global-set-key (kbd "<C-S-down>") 'move-text-down)
(global-set-key (kbd "<C-S-up>") 'move-text-up)

;; Fold the active region
(global-set-key (kbd "C-c C-f") 'fold-this-all)
(global-set-key (kbd "C-c C-F") 'fold-this)
(global-set-key (kbd "C-c M-f") 'fold-this-unfold-all)

;; Yank and indent
(global-set-key (kbd "C-S-y") 'yank-unindented)

;; Toggle quotes
(global-set-key (kbd "C-\"") 'toggle-quotes)

;; Sorting
(global-set-key (kbd "M-s l") 'sort-lines)

;; Increase number at point (or other change based on prefix arg)
(global-set-key (kbd "C-+") 'change-number-at-point)
(global-set-key (kbd "C-?") 'subtract-number-at-point)
(eval-after-load 'undo-tree '(define-key undo-tree-map (kbd "C-?") nil))

;; Browse the kill ring
(global-set-key (kbd "C-x C-y") 'browse-kill-ring)

;; Buffer file functions
(global-set-key (kbd "C-x t") 'touch-buffer-file)
(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)
(global-set-key (kbd "C-x C-k") 'delete-current-buffer-file)

;; Jump from file to containing directory
(global-set-key (kbd "C-x C-j") 'dired-jump) (autoload 'dired-jump "dired")
(global-set-key (kbd "C-x M-j") '(λ (dired-jump 1)))


;; Multi-occur
(global-set-key (kbd "M-s m") 'multi-occur)
(global-set-key (kbd "M-s M") 'multi-occur-in-matching-buffers)


;; -----------------------------------------
;; Keybindings for editing
;; -----------------------------------------
;; 回车缩进
;;(global-set-key "\C-m" 'reindent-then-newline-and-indent)
(global-set-key (kbd "C-<return>") 'reindent-then-newline-and-indent)
(global-set-key (kbd "C-S-i") 'indent-region)

;; Config the mark
(global-set-key (kbd "S-SPC") 'set-mark-command)

;; move text up or down
;;(global-set-key [S-C-up] 'move-text-up)
;;(global-set-key [S-C-down] 'move-text-down)


(global-set-key (kbd "s-.") 'copy-from-above-command)




;; config for smart forward
(global-set-key (kbd "M-<up>") 'smart-up)
(global-set-key (kbd "M-<down>") 'smart-down)
(global-set-key (kbd "M-<left>") 'smart-backward)
(global-set-key (kbd "M-<right>") 'smart-forward)

;; Killing text
(global-set-key (kbd "C-S-k") 'kill-and-retry-line)
(global-set-key (kbd "C-w") 'kill-region-or-backward-word)
(global-set-key (kbd "C-c C-w") 'kill-to-beginning-of-line)

;; Use M-w for copy-line if no active region
(global-set-key (kbd "M-w") 'save-region-or-current-line)
(global-set-key (kbd "M-c") 'save-region-or-current-line)

;; M-i for back-to-indentation
(global-set-key (kbd "M-i") 'back-to-indentation)

;; reload configuration for current emacs
(global-set-key (kbd "C-c C-k") 'eval-buffer)

;; Make shell more convenient
(global-set-key (kbd "C-z") 'shell)

;; Completion at point
(global-set-key (kbd "C-<tab>") 'completion-at-point)

;; Magit
(global-set-key (kbd "C-x m") 'magit-status)
(autoload 'magit-status "magit")

;; Find files by name and display results in dired
(global-set-key (kbd "M-s f") 'find-name-dired)

;; Using dired-view for allowing select file in Dired-Mode by file's fist name.
;;(define-key dired-mode-map (kbd ";") 'dired-view-minor-mode-toggle)
(define-key dired-mode-map (kbd ";") 'dired-view-minor-mode-dired-toggle)


;; Jump to current buffer's directory it is in.
(define-key global-map (kbd "C-x C-j") 'dired-jump)
(define-key global-map (kbd "C-x 4 C-j") 'dired-jump-other-window)
(define-key global-map (kbd "C-x C-h") 'dired-omit-mode)

;; Like isearch, but adds region (if any) to history and deactivates mark
;;(global-set-key (kbd "C-s") 'isearch-forward-use-region)
;;(global-set-key (kbd "C-r") 'isearch-backward-use-region)

;; Like isearch-*-use-region, but doesn't fuck with the active region
;;(global-set-key (kbd "C-S-s") 'isearch-forward)
;;(global-set-key (kbd "C-S-r") 'isearch-backward)

;; Query replace regex key binding
(global-set-key (kbd "M-&") 'query-replace-regexp)

;; Yank selection in isearch
;;(define-key isearch-mode-map (kbd "C-o") 'isearch-yank-selection)

;; close C-SPC for mark, using for toggle fcitx
(global-unset-key (kbd "C-SPC"))
