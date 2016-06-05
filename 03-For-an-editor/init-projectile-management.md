<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Projectile - Project management</a>
<ul>
<li><a href="#sec-1-1">1.1. Configuration</a></li>
<li><a href="#sec-1-2">1.2. Key binding for helm-projectile</a></li>
</ul>
</li>
</ul>
</div>
</div>


# Projectile - Project management<a id="sec-1" name="sec-1"></a>

## Configuration<a id="sec-1-1" name="sec-1-1"></a>

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

## Key binding for helm-projectile<a id="sec-1-2" name="sec-1-2"></a>

    ;; -----------------------------------------
    ;; helm-project
    ;; -----------------------------------------
    (global-set-key (kbd "C-c h") 'helm-projectile)
      ;; Grep in a projectile
      (global-set-key (kbd "C-c p s g") 'helm-projectile-grep)
