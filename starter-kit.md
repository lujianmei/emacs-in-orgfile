<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. About Start kit</a>
<ul>
<li><a href="#sec-1-1">1.1. Starter-kit base</a></li>
<li><a href="#sec-1-2">1.2. <span class="done DONE">DONE</span> Add package source and package management tools</a></li>
<li><a href="#sec-1-3">1.3. Load each of the org files</a></li>
</ul>
</li>
</ul>
</div>
</div>


# About Start kit<a id="sec-1" name="sec-1"></a>

Start kit是来源于一个通过文本方式编程的想法，它将代码与相应的文字描述，通过写作的方式进行了整合，以达到自动生成可用代码的工具。详细可参考地址：<https://github.com/eschulte/emacs24-starter-kit>
Start kit的使用需要一些工程初使配置，而初使配置即在此文件中，文件中增加了 `starter-kit-load` 方法，通过此方法即可让Emacs直接加载 `.org` 文件，并自动运行。它的实现原理实际是采用了 `org-babel` 这个技术，通过 `org-babel` 可以实现不同的语言代码写在同一个文件中，并互不影响的执行。详细可参考地址：<http://orgmode.org/worg/org-contrib/babel/intro.html>

## Starter-kit base<a id="sec-1-1" name="sec-1-1"></a>

-   Load path etc.
    
        (let ((elisp-dir (expand-file-name "src" starter-kit-dir)))
          ;; add the src directory to the load path
          (add-to-list 'load-path elisp-dir)
          ;; load specific files
          (when (file-exists-p elisp-dir)
            (let ((default-directory elisp-dir))
              (normal-top-level-add-subdirs-to-load-path))))
        
        ;; defuns, utilities for whole configuration
        (setq autoload-file (concat starter-kit-dir "09-Defuns/starter-kit-defuns.el"))
        (setq package-user-dir (concat starter-kit-dir "elpa"))
        (setq custom-file (concat starter-kit-dir "custom.el"))

-   Function to check if a packages exist in the load path.  This may be
    used to preempt the installation of ELPA versions of packages whose
    source may already be found in the load path.
    
        (defun starter-kit-loadable-p (package)
          "Check if PACKAGE is loadable from a directory in `load-path'."
          (let ((load-file (concat (symbol-name package) ".el")))
            (catch 'file-found
              (dolist (dir load-path)
                (let ((path (expand-file-name load-file dir)))
                  (when (file-exists-p path)
                    (throw 'file-found path)))))))

-   ELPA archive repositories and two packages to install by default.
    
        (setq package-archives
              '(("gnu"         . "http://elpa.gnu.org/packages/")
                ("org"         . "http://orgmode.org/elpa/")
                ("melpa"       . "http://melpa.org/packages/")
                ("marmalade"   . "http://marmalade-repo.org/packages/")))
        (package-initialize)
        
        (defvar starter-kit-packages nil
          "Libraries that should be installed by default (currently none).")
        
        (defun starter-kit-install-if-needed (&rest packages)
          "Install PACKAGES using ELPA if they are not loadable or installed locally."
          (when packages
            (unless package-archive-contents
              (package-refresh-contents))
            (dolist (package packages)
              (unless (or (starter-kit-loadable-p package)
                          (package-installed-p package))
                (package-install package)))))

-   Function for loading other parts of the starter kit
    
        (defun starter-kit-load (file &optional header-or-tag)
          "Load configuration from other starter-kit-*.org files.
        If the optional argument is the id of a subtree then only
        configuration from within that subtree will be loaded.  If it is
        not an id then it will be interpreted as a tag, and only subtrees
        marked with the given tag will be loaded.
        
        For example, to load all of starter-kit-lisp.org simply
        add (starter-kit-load \"lisp\") to your configuration.
        
        To load only the 'window-system' config from
        starter-kit-misc-recommended.org add
         (starter-kit-load \"misc-recommended\" \"window-system\")
        to your configuration."
          (let ((file (expand-file-name (if (string-match "init-.+\.org" file)
                                            file
                                          (format "starter-kit-%s.org" file))
                                        starter-kit-dir)))
            (org-babel-load-file
             (if header-or-tag
                 (let* ((base (file-name-nondirectory file))
                        (dir  (file-name-directory file))
                        (partial-file (expand-file-name
                                       (concat "." (file-name-sans-extension base)
                                               ".part." header-or-tag ".org")
                                       dir)))
                   (unless (file-exists-p partial-file)
                     (with-temp-file partial-file
                       (insert
                        (with-temp-buffer
                          (insert-file-contents file)
                          (save-excursion
                            (condition-case nil ;; collect as a header
                                (progn
                                  (org-link-search (concat"#"header-or-tag))
                                  (org-narrow-to-subtree)
                                  (buffer-string))
                              (error ;; collect all entries with as tags
                               (let (body)
                                 (org-map-entries
                                  (lambda ()
                                    (save-restriction
                                      (org-narrow-to-subtree)
                                      (setq body (concat body "\n" (buffer-string)))))
                                  header-or-tag)
                                 body))))))))
                   partial-file)
               file))))

## DONE Add package source and package management tools<a id="sec-1-2" name="sec-1-2"></a>

在Emacs第一次初使化打开时，需要初使化reporitories和自动包安装工具，这里引用了Starter-kit中的的 `(starter-kit-insall-if-needed)` 来进行包的自动检查和安装，这里用它来自动安装 `(use-package)` ，从而后面再就只使用 `(use-package)` 来进行包的安装和配置相关，以规范加载代码和提升包的加载速度。

`(use-package)`, which can be using for package loading, check detail at: <https://github.com/jwiegley/use-package>

    ;; 初使安装use-package
    
    (defvar use-package-verbose t)
    
    (starter-kit-install-if-needed 'use-package)

## Load each of the org files<a id="sec-1-3" name="sec-1-3"></a>

-   Starter kit function definitions in [init-for-base-using](02-For-base-using/init-for-base-using.md)
    
        (starter-kit-load "02-For-base-using/init-for-base-using.org")

-   Starter kit function definitions in [init-defuns](09-Defuns/init-defuns.md)
    
        (starter-kit-load "09-Defuns/init-defuns.org")

-   Starter kit function definitions in [init-write-documents](03-For-an-editor/init-write-documents.md)
    
        (starter-kit-load "03-For-an-editor/init-write-documents.org")

-   Starter kit function definitions in [init-index](10-Index/init-index.md)
    
        (starter-kit-load "10-Index/init-index.org")
