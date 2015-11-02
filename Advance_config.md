<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. org-mode基本配置</a>
<ul>
<li><a href="#sec-1-1">1.1. 文档结构信息配置</a></li>
<li><a href="#sec-1-2">1.2. 文档Head信息配置</a></li>
<li><a href="#sec-1-3">1.3. 表格与图片配置</a></li>
</ul>
</li>
</ul>
</div>
</div>


# org-mode基本配置<a id="sec-1" name="sec-1"></a>

## 文档结构信息配置<a id="sec-1-1" name="sec-1-1"></a>

Status详细配置解决说明参见：<http://orgmode.org/manual/In_002dbuffer-settings.html#In_002dbuffer-settings>

    #+STARTUP: overview
    #+STARTUP: hidestars
    #+STARTUP: logdone
    #+PROPERTY: Effort_ALL  0:10 0:20 0:30 1:00 2:00 4:00 6:00 8:00
    #+COLUMNS: %38ITEM(Details) %TAGS(Context) %7TODO(To Do) %5Effort(Time){:} %6CLOCKSUM{Total}
    #+PROPERTY: Effort_ALL 0 0:10 0:20 0:30 1:00 2:00 3:00 4:00 8:00
    #+TAGS: { OFFICE(o) HOME(h) } COMPUTER(c) PROJECT(p) READING(r) PROBLEM(b)
    #+TAGS:  LUNCHTIME(l) ENGLISH(e)
    #+SEQ_TODO: TODO(t) STARTED(s) WAITING(w) APPT(a) | DONE(d) CANCELLED(c) DEFERRED(f)

## 文档Head信息配置<a id="sec-1-2" name="sec-1-2"></a>

Head详细的配置解释说明参见：<http://orgmode.org/manual/Export-settings.html>

    #+TITLE: Zhoushan Dangan Project Schedule
    #+LANGUAGE:  zh
    #+AUTHOR: Lu Jianmei
    #+EMAIL: lu.jianmei@trs.com.cn
    #+OPTIONS:   H:3 num:t   toc:3 \n:nil @:t ::t |:t ^:nil -:t f:t *:t <:t p:t pri:t
    #+OPTIONS:   TeX:t LaTeX:nil skip:nil d:nil todo:t pri:nil tags:not-in-toc
    #+OPTIONS:   author:t creator:t timestamp:t email:t
    #+DESCRIPTION: A notes that include all works and study things in 2015
    #+KEYWORDS:  org-mode Emacs jquery jquery.mobile jquery.ui wcm
    #+INFOJS_OPT: view:nil toc:t ltoc:t mouse:underline buttons:0 path:http://orgmode.org/org-info.js
    #+EXPORT_SELECT_TAGS: export
    #+EXPORT_EXCLUDE_TAGS: noexport
    #+LATEX_HEADER: \usepackage{xeCJK}
    #+LATEX_HEADER: \setCJKmainfont{SimSun}
    #+LATEX_CLASS: cn-article
    #+STARTUP: logredeadline, logreschedule
    #+ATTR_HTML: :border 2 :rules all :frame all

如果配置项目管理，可以按添加如下配置

    #+COLUMNS: #+COLUMNS: %25ITEM %DEADLINE %SCHEDULED %11Status %9Approved(Approved?){X} %TAGS %PRIORITY %TODO
    #+Status_ALL: "In progress" "Not started yet" "Finished" ""
    #+Approved_ALL: "[ ]" "[X]"

## 表格与图片配置<a id="sec-1-3" name="sec-1-3"></a>

表格导出与图片导出成latex时，需要设置相应的导出latex参数，具体参数参见：<http://orgmode.org/org.html#LaTeX-specific-attributes>

    #+ATTR_LATEX: :environment longtable :align l|lp{3cm}r|l
    #+ATTR_LATEX: :mode math :environment bmatrix :math-suffix \times

    ;;图片
    #+ATTR_LATEX: :width 5cm :options angle=90
    [[./img/sed-hr4049.pdf]]
    #+ATTR_LATEX: :caption \bicaption{HeadingA}{HeadingB}
    [[./img/sed-hr4049.pdf]]
