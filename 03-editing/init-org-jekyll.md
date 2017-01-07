<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. 用Org写博客，导出为Jekyll</a></li>
<li><a href="#sec-2">2. 文件尾标记</a></li>
</ul>
</div>
</div>


# 用Org写博客，导出为Jekyll<a id="sec-1" name="sec-1"></a>

      ;; 添加org-jekyll包
      (use-package org-jekyll
        :defer t  )
    
    (setq org-publish-jr "~/workspace/github/my-blog/work-notes/notes/")
    (setq org-publish-jr-blog "~/workspace/github/my-blog/_posts/")
    
    (setq org-jekyll-lang-subdirs '(("en" . "publish-blog/blog/")))
    
    (add-to-list 'org-publish-project-alist
                 `("jr-org"
                   :base-directory "~/workspace/github/my-blog/work-notes/notes/"
                   :recursive t
                   :base-extension "org"
                   :publishing-directory ,org-publish-jr
                   :exclude "^blog\\|^bitacora\\|jr.org"
                   :site-root "http://www.lujianmei.com"
                   :jekyll-sanitize-permalinks t
                   :publishing-function org-html-publish-to-html
                   :section-numbers nil
                   :headline-levels 4
                   :table-of-contents t
                   :auto-index nil
                   :auto-preamble nil
                   :body-only nil
                   :auto-postamble nil))
    
    (add-to-list 'org-publish-project-alist
                 `("jr-img"
                   :base-directory "~/workspace/github/my-blog/work-notes/notes/"
                   :recursive t
                   :exclude "^publish"
                   :base-extension "jpg\\|gif\\|png"
                   :publishing-directory ,org-publish-jr
                   :publishing-function org-html-publish-attachment))
    
    (add-to-list 'org-publish-project-alist
                 '("jr" :components ("jr-org"
                                     "jr-img")))

# 文件尾标记<a id="sec-2" name="sec-2"></a>

    (provide 'init-org-jekyll)
    ;; init-org-jekyll.el end here
