<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Configurations for better using experiences</a>
<ul>
<li><a href="#sec-1-1">1.1. Moving back to previous places</a></li>
<li><a href="#sec-1-2">1.2. Window move - switching between windows</a></li>
<li><a href="#sec-1-3">1.3. Auto Truncate lines</a></li>
<li><a href="#sec-1-4">1.4. Spell checking</a>
<ul>
<li><a href="#sec-1-4-1">1.4.1. Install Aspell</a></li>
<li><a href="#sec-1-4-2">1.4.2. Helm-flyspell</a></li>
</ul>
</li>
</ul>
</li>
</ul>
</div>
</div>


# Configurations for better using experiences<a id="sec-1" name="sec-1"></a>

## Moving back to previous places<a id="sec-1-1" name="sec-1-1"></a>

移动到上一个位置，用于在长文件中进行鼠标的定位。

    ;; Handy way of getting back to previous places.
    (bind-key "C-x p" 'pop-to-mark-command)
    (setq set-mark-command-repeat-pop t)

## Window move - switching between windows<a id="sec-1-2" name="sec-1-2"></a>

一个Frame中打开多个windows后，可以通过增加如下配置，以达到在多个windows中进行跳转；
当窗口比较多时，可以直接使用 `(C-x o)` 进行快速跳转；

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

## Auto Truncate lines<a id="sec-1-3" name="sec-1-3"></a>

自动拆行，当一个行过长时，自动折行。

## Spell checking<a id="sec-1-4" name="sec-1-4"></a>

自动拼写检查，在写英文文章时会比较好用，而这里采用Aspell来做为检查服务，因此需要先安装Aspell.

### Install Aspell<a id="sec-1-4-1" name="sec-1-4-1"></a>

在Mac电脑上，可以用 `brew install aspell` 来完成安装，在Linux系统上可以直接通过命令进行安装即可。安装完成后，确认在终端可以通过输入 `aspell` 命令来确认已经安装成功。

### Helm-flyspell<a id="sec-1-4-2" name="sec-1-4-2"></a>

这里使用 `helm-flyspell` 包来利用helm来完成拼写检查。

      (use-package helm-flyspell
        :defer nil
        :bind
        (:map flyspell-mode-map ("C-;" . helm-flyspell-correct))
         )
    (add-hook 'org-mode-hook 'flyspell-mode)
    (add-hook 'markdown-mode-hook 'flyspell-mode)
    (add-hook 'flyspell-mode-hook 'helm-flyspell-correct)
