<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Latex mode</a></li>
</ul>
</div>
</div>


# Latex mode<a id="sec-1" name="sec-1"></a>

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
