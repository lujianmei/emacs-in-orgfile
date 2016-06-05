
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
