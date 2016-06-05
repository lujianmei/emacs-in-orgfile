<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Searching upgrading</a>
<ul>
<li><a href="#sec-1-1">1.1. <span class="done DONE">DONE</span> Avy</a></li>
<li><a href="#sec-1-2">1.2. <span class="done DONE">DONE</span> Ace-isearch mode</a></li>
</ul>
</li>
</ul>
</div>
</div>


# Searching upgrading<a id="sec-1" name="sec-1"></a>

## DONE Avy<a id="sec-1-1" name="sec-1-1"></a>

Quickly jump to a position in the current view.
已经转使用ace-isearch，因此此种配置可以去掉。也可以单独保留，与ace-isearch不冲突。

    (use-package avy
      :defer t)
      ;; I use the jj key-chord for this; see the definitions for key-chord
    (use-package avy-zap
      :defer t
      :bind
      (("M-z" . avy-zap-up-to-char-dwim)
       ("M-Z" . avy-zap-to-char-dwim)))

## DONE Ace-isearch mode<a id="sec-1-2" name="sec-1-2"></a>

-   State "DONE"       from ""           <span class="timestamp-wrapper"><span class="timestamp">[2016-05-30 Mon 20:18]</span></span>

Ace-isearch为集成了isearch, ace-jump-mode, avy, helm-swoop四个模式为一体的更方便的搜索体验。
Ace-isearch会根据输入的内容长度，来判断采用哪种模式。
The "default" behavior can be summrized as:
-   L = 1 : ace-jump-mode or avy
-   1 < L < 6 : isearch
-   L >= 6 : helm-swoop

在实际使用时，如果我需要定位到当前屏幕的具体位置时，则输入第一个字母，然后稍等一下，即启动ace-jump-mode，屏幕此时会Mark上和我输入的首字母相同的位置，并通过不同和字母显示位置，我们只需要根据它显示的位置输入显示的字母，即可完成精准定位。
但当我需要输入一个单词进行搜索时，则输入内容在1-6个字母时，采用的是isearch，即字母完全匹配的全文搜索模式。
当字母大于6个时，即自动启动helm-swoop模式，进行快速选择。

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
