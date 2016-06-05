<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Configurations for better using experiences</a>
<ul>
<li><a href="#sec-1-1">1.1. Moving back to previous places</a></li>
<li><a href="#sec-1-2">1.2. Window move - switching between windows</a></li>
<li><a href="#sec-1-3">1.3. Auto Truncate lines</a></li>
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
