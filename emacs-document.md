<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Emacs功能导览</a></li>
<li><a href="#sec-2">2. 功能模块</a>
<ul>
<li><a href="#sec-2-1">2.1. Checking for manual</a></li>
<li><a href="#sec-2-2">2.2. Org Mode</a>
<ul>
<li><a href="#sec-2-2-1">2.2.1. Property</a></li>
<li><a href="#sec-2-2-2">2.2.2. Column view</a></li>
<li><a href="#sec-2-2-3">2.2.3. Capture</a></li>
<li><a href="#sec-2-2-4">2.2.4. Agenda View</a></li>
</ul>
</li>
<li><a href="#sec-2-3">2.3. Tools in Emacs</a></li>
<li><a href="#sec-2-4">2.4. Emacs Wanderlust</a>
<ul>
<li><a href="#sec-2-4-1">2.4.1. Wanderlust Install</a></li>
<li><a href="#sec-2-4-2">2.4.2. Wanderlust Configuration</a></li>
</ul>
</li>
<li><a href="#sec-2-5">2.5. Eshell</a></li>
<li><a href="#sec-2-6">2.6. Tramp</a></li>
<li><a href="#sec-2-7">2.7. Auctex</a></li>
<li><a href="#sec-2-8">2.8. Latex</a></li>
<li><a href="#sec-2-9">2.9. Plantuml</a></li>
<li><a href="#sec-2-10">2.10. Graphviz</a></li>
<li><a href="#sec-2-11">2.11. Diaat</a></li>
<li><a href="#sec-2-12">2.12. TernJs</a></li>
<li><a href="#sec-2-13">2.13. Sunrise Commander</a></li>
<li><a href="#sec-2-14">2.14. GNUS with Offlineimap and mu4e and msmtp</a>
<ul>
<li><a href="#sec-2-14-1">2.14.1. Offlineimap</a></li>
<li><a href="#sec-2-14-2">2.14.2. Mu4e</a></li>
<li><a href="#sec-2-14-3">2.14.3. msmtp</a></li>
</ul>
</li>
<li><a href="#sec-2-15">2.15. TaskJuggler</a>
<ul>
<li><a href="#sec-2-15-1">2.15.1. 用orgmode写支持tjp的项目任务属性</a></li>
<li><a href="#sec-2-15-2">2.15.2. 项目及资源标记</a></li>
<li><a href="#sec-2-15-3">2.15.3. 导出tjp文件</a></li>
<li><a href="#sec-2-15-4">2.15.4. 修改导出的文件格式或模板</a></li>
</ul>
</li>
</ul>
</li>
<li><a href="#sec-3">3. org-mode基本配置</a>
<ul>
<li><a href="#sec-3-1">3.1. 文档结构信息配置</a></li>
<li><a href="#sec-3-2">3.2. 文档Head信息配置</a></li>
<li><a href="#sec-3-3">3.3. 表格与图片配置</a></li>
</ul>
</li>
<li><a href="#sec-4">4. 快捷键</a>
<ul>
<li><a href="#sec-4-1">4.1. Base</a></li>
<li><a href="#sec-4-2">4.2. Org-mode</a></li>
<li><a href="#sec-4-3">4.3. 宏</a></li>
<li><a href="#sec-4-4">4.4. Dired</a></li>
<li><a href="#sec-4-5">4.5. Tern</a></li>
<li><a href="#sec-4-6">4.6. Wanderlust # Removed package, using mutt instead</a></li>
<li><a href="#sec-4-7">4.7. Projectile &amp; helm</a></li>
<li><a href="#sec-4-8">4.8. Projectile</a></li>
<li><a href="#sec-4-9">4.9. SMIX</a></li>
<li><a href="#sec-4-10">4.10. Tabbar</a></li>
<li><a href="#sec-4-11">4.11. Magit</a></li>
<li><a href="#sec-4-12">4.12. Latex</a></li>
<li><a href="#sec-4-13">4.13. Sunrise Commander</a></li>
<li><a href="#sec-4-14">4.14. Markdown</a></li>
<li><a href="#sec-4-15">4.15. Graphviz-dot-mode</a></li>
<li><a href="#sec-4-16">4.16. Read Code</a></li>
<li><a href="#sec-4-17">4.17. Magit</a></li>
<li><a href="#sec-4-18">4.18. Dash</a></li>
</ul>
</li>
<li><a href="#sec-5">5. 包管理器</a>
<ul>
<li>
<ul>
<li><a href="#sec-5-0-1">5.0.1. Package List</a></li>
<li><a href="#sec-5-0-2">5.0.2. 需要重点学习的包</a></li>
</ul>
</li>
</ul>
</li>
<li><a href="#sec-6">6. Supplement</a>
<ul>
<li><a href="#sec-6-1">6.1. Org-mode Key-bindings from official</a></li>
</ul>
</li>
</ul>
</div>
</div>

-   [{Back to Index}](../work-note-in-2015.md)

# Emacs功能导览<a id="sec-1" name="sec-1"></a>

# 功能模块<a id="sec-2" name="sec-2"></a>

## Checking for manual<a id="sec-2-1" name="sec-2-1"></a>

通过emacs可以查看elisp的接口文档，从中间找到各个功能模块的变量定义等；
操作办法： **M-: (info "(elisp) Memory Usage")**

## Org Mode<a id="sec-2-2" name="sec-2-2"></a>

### Property<a id="sec-2-2-1" name="sec-2-2-1"></a>

属性可以用于显示在column视图中，或者agenda view中，增加对任务的描述，描述可以是状态、属性补充等目标；它具有属性的继承性，因此在项目根结点上配置属性后，即可以在子任务中使用这些属性的备选值，使用快捷键进行切换；
-   配置根属性的备选值
    在项目根节点上，配置如下属性，即可以通过 **C-c C-x p** 命令添加一条属性，并将光标定位在属性上后，通过 **S-left/right** 切换所需的属性值；

### Column view<a id="sec-2-2-2" name="sec-2-2-2"></a>

Column view是建立于org-mode任务管理之上的快速以表格查看各个任务情况的视图，可以使用 **C-c C-x C-c** 来打开column view，而此种查看方式只是一种查看，并不会被打印，如果需要通过动态管理column view，并支持打印，可以通过 **C-c C-x i** 插入一个动态的column部分在文件中，但此部分不是动态关联的，即修改了任务内容，插入的column view是不会更新的，但可以通过执行 **C-c C-x C-u** 进行更新；注：已经通过配置(add-hook 'before-save-hook 'org-update-all-dblocks)达到在保存文件时，即会更新文件中所有的column view中的数据；
当需要针对某一个特定的任务组生成一个column view时，可以在此任务组的任务上，执行 **C-c C-x p** 插入属性，选择id，输入一个id值，然后在插入动态column时，选择刚刚输入的id值即可；如果需要对这个表特殊定义不同的column结构，可以再执行 **C-c C-x p** 时选择 **COLUMN** 来重新定义一个新的column结构内容；保存即可自动更新表格；

### Capture<a id="sec-2-2-3" name="sec-2-2-3"></a>

Capture用于快速记录任务或者idea内容，并支持在后面进行capture的内容refile；

### Agenda View<a id="sec-2-2-4" name="sec-2-2-4"></a>

1.  Agenda基本命令使用

    1.  Agenda View用于以汇总视图的模式，组织单个或个多个文件中的任务，并可以按要求进行组织及排序，显示出当前各个项目的情况详情；Agenda view有如下几种视图
    2.  按日历格式显示任务，可以指定日期、日期范围、按日、周、月、年来进行显示任务清单
        此模式目的是以当前日或者周来查看需要完成的工作清单；
    3.  显示所有未完成的列表
        显示所有文件或项目中标记为TODO的任务列表，没有时间
    4.  匹配按表头、标签、TODO状态等来显示任务清单
    5.  按timeline模式显示，按时间排序
    6.  搜索模式，按检索词的检索结果来组织显示数据
    7.  问题项目或问题任务模式，显示各个项目中出问题或暂停的项目
    8.  按自定义视图显示内容
    
    9.  在Agenda View模式中，查看或修改文件：
    
    当需要显示详细工作清单时，可以选择要查看的任务条目，点击 **TAB** 键，打开当前任务所在文件；如果需要修改，则在原文件中进行修改，修改完成后保存；切换到Agenda View中，按 **r** 键，则可以刷新修改后的内容；
    在Agenda View中需要使用快捷键操作，具体可以参考： <http://orgmode.org/org.html#Agenda-commands>， 快捷键可以支持直接通过此视图修改原org文件中的状态；
    
    1.  通过关键词搜索的方式显示
        可以采用搜索关键词的方式显示，搜索关键词可以为： ‘+computer +wifi -ethernet‘，即包含computer, wifi，不包含ethernet的任务清单；
    2.  显示Stuck项目

2.  对Agenda View进行修改

    1.  新增新的命令
        定义新的命令，来存储一些常用的搜索条件，定义需要显示的数据；此种方法可以按下面的代码形式，对Agenda Dispather进行定制：
    
        (setq org-agenda-custom-commands
                   '(("x" agenda)
                     ("y" agenda*)
                     ("w" todo "WAITING")
                     ("W" todo-tree "WAITING")
                     ("u" tags "+boss-urgent")
                     ("v" tags-todo "+boss-urgent")
                     ("U" tags-tree "+boss-urgent")
                     ("f" occur-tree "\\<FIXME\\>")
                     ("h" . "HOME+Name tags searches") ; description for "h" prefix
                     ("hl" tags "+home+Lisa")
                     ("hp" tags "+home+Peter")
                     ("hk" tags "+home+Kim")))
    
    如上面定义了一些新的命令，即可以通过 **C-c a x** 打开agenda，通过 **C-c a w** 打开只包含 "WAITING"的状态的任务清单；
    1.  对现有命令的显示模式进行修改，采用block view的方式显示，即在一个buffer中，显示多个block，一次性查看不同的内容要求；
    
        (setq org-agenda-custom-commands
                   '(("h" "Agenda and Home-related tasks"
                      ((agenda "")
                       (tags-todo "home")
                       (tags "garden")))
                     ("o" "Agenda and Office-related tasks"
                      ((agenda "")
                       (tags-todo "work")
                       (tags "office")))))
    
    如上面定义，则在一个view buffer中，定义了不同的block，显示不同的内容， 如 **C-c a h** 则会显示三块内容，第一块显示agenda, 第二块显示包含"home"的todo标签的任务，第三个则是包含"garden"标签的任务；
    1.  org-mode包含一些可定义的命令，可以用于支持对自定义的命令进行特殊的定制，这些定义默认是通过全局有效使用，如果需要对个别命令，采用不同的配置要求，则可以针对不同的命令进行设备；
    
        (setq org-agenda-custom-commands
                   '(("w" todo "WAITING"
                      ((org-agenda-sorting-strategy '(priority-down))
                       (org-agenda-prefix-format "  Mixed: ")))
                     ("U" tags-tree "+boss-urgent"
                      ((org-show-context-detail 'minimal)))
                     ("N" search ""
                      ((org-agenda-files '("~org/notes.org"))
                       (org-agenda-text-search-extra-files nil)))))
    
    如上面的定义，当执行 **C-c a w** 时显示只包含 "WAITING" 标签的任务，而再通过 **(org-agenda-sorting-strategy '(priority-down)** 来配置此view的排序条件为按优先级进行倒序排序；并增加 **Mixed:** 的前置；
    另外，配置个性修改参数，可以为单命令级别进行配置，也可以为个别block进行单独配置命令，如：
    
        (setq org-agenda-custom-commands
                  '(("h" "Agenda and Home-related tasks"
                     ((agenda)
                      (tags-todo "home")
                      (tags "garden"
                            ((org-agenda-sorting-strategy '(priority-up)))))
                     ((org-agenda-sorting-strategy '(priority-down))))
                    ("o" "Agenda and Office-related tasks"
                     ((agenda)
                      (tags-todo "work")
                      (tags "office")))))
    
    如上面命令，则是对 **C-c a h** 命令进行配置了整体 **((org-agenda-sorting-strategy '(priority-down)))**, 然而又单独对显示中的 **home** block进行配置 **((org-agenda-sorting-strategy '(priority-up)))** 的排序策略；
    需要注意的是，参数中的值，可以是lisp语句，如果只是一个字符串，需要添加双引号；
    
    1.  如果想要只针对某一种文本内容进行配置，则可以采用 **org-agenda-custom-commands-contexts** 进行配置，如：
    
        (setq org-agenda-custom-commands-contexts
                   '(("o" (in-mode . "message-mode"))))
    
    如上面命令，则只针对 **message-mode** 有效；
    还可以将某一命令中，引用其它命令进行操作，如：
    
        (setq org-agenda-custom-commands-contexts
                   '(("o" "r" (in-mode . "message-mode"))))

3.  Agenda View 导出

    Agenda view可以导出为text, html, pdf, postscript, icalendar格式；

## Tools in Emacs<a id="sec-2-3" name="sec-2-3"></a>

-   Ielm Elisp编译器，M-x ielm
-   使配置生效，M-x eval-buffer
-   宏
-   

## Emacs Wanderlust<a id="sec-2-4" name="sec-2-4"></a>

### Wanderlust Install<a id="sec-2-4-1" name="sec-2-4-1"></a>

在Archlinux上有包的管理：因此直接通过sudo命令即可以直接安装；

    sudo pacman -S wanderlust

安装完成后，它可能会在/usr/share/emacs/site-lisp/wl下生成对应的el配置文件；
可以将配置文件拷到对应~/.emacs.d/site-list/wl下；
接着需要安装它的相应的依赖包：elmo, bbdb, semi, w3m, 如果使用ssl协议还需要下载ssl.el文件；
这些包可以在一些相应的网站可以下载：如<http://www.emacswiki.org/上下载>；

### Wanderlust Configuration<a id="sec-2-4-2" name="sec-2-4-2"></a>

下载我的配置文件到你的文件夹中：<https://github.com/lujianmei/.emacs.d>；
找到~/.emacs.d/user/kevin/init-wl.el~文件下载；
-   配置用户名，目录等相关信息
    -   按文件中的目录信息配置相关的存储目录，默认为~/mails，如果不需要修改则可以不用修改；
-   配置imap目录，与邮箱web端的目录结构相同
    -   参照~/.emacs.d/user/kevin/folders文件，配置与生产环境相同的目录结构；
    -   可以直接通过邮箱服务端配置好邮件的过滤功能，然后直接在wl中进行下载查看；
-   配置登录密码，邮件发送密码
    -   init-wl.el文件中已经默认配置好了passwd的文件目录，用于存储imap, stmp的加密后的密码信息的；
    -   因此可以将folders文件按要求放到对应的目录下，然后在登录邮箱，并成功发送邮件后，执行：M-x elmo-passwd-alist-save方法，它即会自动将密码信息写入此文件中；
    -   下次即不再要求通过密码校验了；
-   配置签名文件
    -   可以在init-wl.el文件中找到对应的signature文件的目录，因此在对应的地方新建一个文件，然后将签名内容拷进去；
    -   则可以在发送邮件时自动生成对应的签名在后面；
-   配置邮件附件打开方式
    -   参照~/.emacs.d/user/kevin/mailcap文件，配置当前操作系统下的用来查看附件文件的方式；
    -   如下例子：
        
            application/pdf; okular  %s
            application/msword; catdoc %s
            application/octet-stream; et  %s
            application/octet-stream; wpp  %s
            application/octet-stream; wps  %s
            application/*; xdg-open  %s
            image/*; ristretto %s
            text/html; chromium %s
            text/*; emacsclient -c %s
            video/*; xdg-open %s
            audio/*; xdg-open %s
            application/x-rar; xarchiver %s
            application/x-zip; xarchiver %s
            application/x-tar; xarchiver %s

## Eshell<a id="sec-2-5" name="sec-2-5"></a>

**\***

## Tramp<a id="sec-2-6" name="sec-2-6"></a>

## Auctex<a id="sec-2-7" name="sec-2-7"></a>

\*\*

## Latex<a id="sec-2-8" name="sec-2-8"></a>

## Plantuml<a id="sec-2-9" name="sec-2-9"></a>

<http://www.plantuml.com/>
-   安装依赖
    在archlinux的aur中找到plantuml进行安装；
-   使用，在需要生成的图的位置代码用如何代码框起来

     #+begin_src plantuml :file some_filename.png :cmdline -r -s 0.8
    <context of ditaa source goes here>
     #+end_src

## Graphviz<a id="sec-2-10" name="sec-2-10"></a>

<http://www.graphviz.org/>
-   安装依赖

    sudo pacman -S graphviz

-   使用，在需要生成的图的位置代码用如何代码框起来

    #+begin_src dot :file some_filename.png :cmdline -Kdot -Tpng
       <context of graphviz source goes here>
    #+end_src

## Diaat<a id="sec-2-11" name="sec-2-11"></a>

-   安装依赖

    sudo pacman -S ditaa

-   使用，在需要生成的图的位置代码用如何代码框起来

     #+begin_src ditaa :file some_filename.png :cmdline -r -s 0.8
    <context of ditaa source goes here>
     #+end_src

## TernJs<a id="sec-2-12" name="sec-2-12"></a>

## Sunrise Commander<a id="sec-2-13" name="sec-2-13"></a>

-   说明
    Sunrise是一款类似于dired的命令行的文件管理器，具有大量命令行操作工具；
-   使用方法：显示当前及其子文件夹下所有文件
    press C-c C-f and type:  -not -type d

## GNUS with Offlineimap and mu4e and msmtp<a id="sec-2-14" name="sec-2-14"></a>

### Offlineimap<a id="sec-2-14-1" name="sec-2-14-1"></a>

1.  安装

        sudo pacman -Ss offlineimap

2.  配置

    Linux 配置
    
        [general]
        ui = TTYUI
        accounts = TRS
        pythonfile = ~/.mutt/source/offlineimap.py
        fsync = False
        
        [Account TRS]
        localrepository = TRS-Local
        remoterepository = TRS-Remote
        status_backend = sqlite
        postsynchook = notmuch new
        # Minutes between syncs
        autorefresh = 5
        # Number of quick-syncs between autorefreshes. Quick-syncs do not update if the
        # only changes were to IMAP flags
        quick = 10
        
        [Repository TRS-Local]
        type = Maildir
        localfolders = ~/.mutt/mails/lu.jianmei/
        nametrans = lambda foldername: foldername.decode('imap4-utf-7').encode('utf-8')
        #nametrans = lambda folder : {'drafts':   '草稿箱',
        #                            'inbox':     'Inbox',
        #                            'sent':     '已发送',
        ##                            'flagged':  '[TRS]/Starred',
        #                            'trs':  'trs',
        #                            'haier':  'haier',
        #                            'pm':  'pm',
        ##                            'trash':    '[TRS]/Bin',
        #                            'archive':  'All Mail',
        ##                           }.get(folder.decode('imap4-utf-7').encode('utf-8'), folder.decode('imap4-utf-7').encode('utf-8'))
        #                           }.get(folder.decode('imap4-utf-7').encode('utf-8'), folder.decode('imap4-utf-7').encode('utf-8'))
        
        [Repository TRS-Remote]
        sslcacertfile=/etc/ssl/certs/ca-certificates.crt
        maxconnections = 2
        type = IMAP
        auth = on
        ssl = yes
        #reference = Mail
        remotehost = imap.qiye.163.com
        remoteuser = lu.jianmei@trs.com.cn
        remoteport = 993
        
        remotepasseval = get_gpg_pass(keyfile="/home/kevin/.mutt/.my-pwds.gpg")
        realdelete = no
        startdate = 2015-04-01
        # solve foldername encoding, for supporting chinese foldername in remote server
        # foldername: foldername.decode('imap4-utf-7').encode('utf-8')
        #nametrans = lambda folder: foldername.decode('imap4-utf-7').encode('utf-8') : {'Drafts':     'drafts',
        nametrans = lambda folder: folder.decode('imap4-utf-7').encode('utf-8')
        
        #folderfilter = lambda folder: folder not in ['/Bin', '/Spam','[TRS]/akamai','[TRS]/errors','[TRS]/me','[TRS]/nagios']
        folderfilter = lambda folder: folder in ['INBOX','已发送','草稿箱', 'trs','haier','pm']
        # Instead of closing the connection once a sync is complete, offlineimap will
        # send empty data to the server to hold the connection open. A value of 60
        # attempts to hold the connection for a minute between syncs (both quick and
        # autorefresh).This setting has no effect if autorefresh and holdconnectionopen
        # are not both set.
        keepalive = 60
        # OfflineIMAP normally closes IMAP server connections between refreshes if
        # the global option autorefresh is specified.  If you wish it to keep the
        # connection open, set this to true. This setting has no effect if autorefresh
        # is not set.
        holdconnectionopen = yes
    
    Mac配置
    
        [general]
        ui = TTYUI
        accounts = TRS
        pythonfile = ~/.mutt/source/offlineimap.py
        fsync = False
        
        [Account TRS]
        localrepository = TRS-Local
        remoterepository = TRS-Remote
        status_backend = sqlite
        #postsynchook = notmuch new
        # Minutes between syncs, use mu4e to refresh
        autorefresh = 0
        # Number of quick-syncs between autorefreshes. Quick-syncs do not update if the
        # only changes were to IMAP flags
        quick = 10
        
        [Repository TRS-Local]
        type = Maildir
        #localfolders = ~/.mutt/mails/lu.jianmei/
        localfolders = ~/Maildir/lu.jianmei/
        #nametrans = lambda foldername: foldername.decode('imap4-utf-7').encode('utf-8')
        #nametrans = lambda folder : {'drafts':   '草稿箱',
        #                            'inbox':     'Inbox',
        #                            'sent':     '已发送',
        ##                            'flagged':  '[TRS]/Starred',
        #                            'trs':  'trs',
        #                            'haier':  'haier',
        #                            'pm':  'pm',
        ##                            'trash':    '[TRS]/Bin',
        #                            'archive':  'All Mail',
        ##                           }.get(folder.decode('imap4-utf-7').encode('utf-8'), folder.decode('imap4-utf-7').encode('utf-8'))
        #                           }.get(folder.decode('imap4-utf-7').encode('utf-8'), folder.decode('imap4-utf-7').encode('utf-8'))
        
        [Repository TRS-Remote]
        #Sslcacertfile=/etc/ssl/certs/ca-certificates.crt
        sslcacertfile =  /Users/kevin/.emacs.d/ca-bundle.crt
        maxconnections = 2
        type = IMAP
        auth = on
        ssl = on
        #reference = Mail
        remotehost = imap.qiye.163.com
        remoteuser = lu.jianmei@trs.com.cn
        
        # imap protocol port: 993 for ssl, 143 for none ssl
        remoteport = 993
        
        #remotepasseval = get_gpg_pass(keyfile="/home/kevin/.mutt/.my-pwds.gpg")
        realdelete = no
        
        
        #folderfilter = lambda folder: folder not in ['/Bin', '/Spam','[TRS]/akamai','[TRS]/errors','[TRS]/me','[TRS]/nagios']
        # use offlineimap --info can know the remote folders. (following two unknow name is 已发送 and 草稿箱 and 已删除)
        folderfilter = lambda folder: folder in ['INBOX','trs','haier','pm','me','&XfJT0ZAB-','&g0l6P3ux-','Sent','&XfJSIJZk-']
        
        startdate = 2015-01-01
        # solve foldername encoding, for supporting chinese foldername in remote server
        # foldername: foldername.decode('imap4-utf-7').encode('utf-8')
        #nametrans = lambda folder: foldername.decode('imap4-utf-7').encode('utf-8') : {'Drafts':     'drafts',
        #nametrans = lambda x: 'INBOX.' + x
        nametrans = lambda folder: folder.decode('imap4-utf-7').encode('utf-8')
        ###nametrans = lambda folder : {'草稿箱':     'drafts',
        ###                            'INBOX':  'inbox',
        ###                            '已发送':  'sent',
        ####                            '[TRS]/Starred':    'flagged',
        ###                            'trs':    'trs',
        ###                            'haier':    'haier',
        ###                            'pm':    'pm',
        ####                            'Bin':        'trash',
        ###                            'All Mail':   'archive',
        ####                           }.get(folder.decode('imap4-utf-7').encode('utf-8'), folder.decode('imap4-utf-7').encode('utf-8'))
        ###                           }.get(folder, folder.decode('imap4-utf-7').encode('utf-8'))
        
        # Instead of closing the connection once a sync is complete, offlineimap will
        # send empty data to the server to hold the connection open. A value of 60
        # attempts to hold the connection for a minute between syncs (both quick and
        # autorefresh).This setting has no effect if autorefresh and holdconnectionopen
        # are not both set.
        keepalive = 60
        # OfflineIMAP normally closes IMAP server connections between refreshes if
        # the global option autorefresh is specified.  If you wish it to keep the
        # connection open, set this to true. This setting has no effect if autorefresh
        # is not set.
        holdconnectionopen = yes

3.  配置安全密码

### Mu4e<a id="sec-2-14-2" name="sec-2-14-2"></a>

mu4e基于mu开发，直接通过maildir格式文件进行读取邮件内容；因此可以通过offlineimap进行邮件下载，然后通过mu4e进行邮件读取及发送邮件即可；
官方网站：[<http://www.djcbsoftware.nl/code/mu>]

1.  安装

        yaourt -S mu
    
    mac上的安装
    
        # install email client related
        brew install gnutls
        #install email related
        brew install mu --with-emacs
        brew install offlineimap msmtp
        brew install curl --with-openssl && brew link curl —forc
        brew install html2text w3m

2.  配置

    配置直接通过emacs中的init-mu4e.el文件进行配置；
    完成mu4e的配置后，需要创建~/.authinfo文件，存储所需要的服务器用户名密码等信息；
    
        machine smtp.qiye.163.com login username password yourpassword

### msmtp<a id="sec-2-14-3" name="sec-2-14-3"></a>

msmtp工具用于发送邮件，mutt的基本配置内容可以参照<https://github.com/lujianmei/.mutt> 上的配置进行处理；

    brew install msmtp

## TaskJuggler<a id="sec-2-15" name="sec-2-15"></a>

taskjuggler是一个出色的项目管理工具，可以支持通过org的todo任务清单，直接导出taskjuggler格式的文件tjp文件，然后可以在安装taskjuggler后，直接通过命令 **tj3 file.tjp** 将生成html项目清单文件；

### 用orgmode写支持tjp的项目任务属性<a id="sec-2-15-1" name="sec-2-15-1"></a>

-   Task\_id: 在todo任务条上，执行 **C-c C-x p** 并输入 **task\_id** 来定义一个任务唯一的id；
-   Depends: 执行 **C-c C-x p** 输入depends定义一个任务的前置任务；
-   Effort:  执行 **C-c C-x p** 输入effort定义一个任务的前置任务；支持小时h, 日d, 周w；
-   Allocate: 执行 **C-c C-x p** 输入allocate定义任务的执行人；
-   Start: 在任务开始的地方，需要输入项目开始时间，执行 **C-c C-x p** 输入start定义任务的执行人；注意，时间格式需要是：2012-4-2-0:00-+0800
-   其它资源：

    task_id
    任务标识
    start
    开始日期
    duration
    持续时间
    Effort
    工作量
    allocate
    资源分配
    depends
    前置任务
    ORDERED
    任务关联
    rate
    费率

### 项目及资源标记<a id="sec-2-15-2" name="sec-2-15-2"></a>

为了方便生成项目及资源列表，需要在要生成的项目顶级任务上，标记上 **project** 标签，则此任务会被认为一个项目；而相应的资源， 需要在org文件中，另起一个一级子列表，标明资源列表，打上 \*resources\*标识，具体可参照如下例子：

        * 资源 :resource:
        ** 雷悦
        :PROPERTIES:
      :resource_id: leiyue
      :rate:     300
      :email:    "tellmemore@gmail.com"
      :Phone:    "136xxxxxxxx"
    :END:
        ** 谢莺
        :PROPERTIES:
      :resource_id: xieying
      :rate:     250
      :email:    "tellyoumore@gmail.com"
      :Phone:    "186xxxxxxxx"
    :END:

其中的tag名称，可以在 **~/.emacs.d/user/kevin/settings/init-taskjuggle.el** 文件中进行修改；

### 导出tjp文件<a id="sec-2-15-3" name="sec-2-15-3"></a>

在org文件上，执行 **C-c C-e J j** 导出此org文件为tjp文件，然后打开终端，执行 **tj3 file.tjp** 即可生成为项目文件；

### 修改导出的文件格式或模板<a id="sec-2-15-4" name="sec-2-15-4"></a>

# org-mode基本配置<a id="sec-3" name="sec-3"></a>

## 文档结构信息配置<a id="sec-3-1" name="sec-3-1"></a>

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

## 文档Head信息配置<a id="sec-3-2" name="sec-3-2"></a>

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

## 表格与图片配置<a id="sec-3-3" name="sec-3-3"></a>

表格导出与图片导出成latex时，需要设置相应的导出latex参数，具体参数参见：<http://orgmode.org/org.html#LaTeX-specific-attributes>

    #+ATTR_LATEX: :environment longtable :align l|lp{3cm}r|l
    #+ATTR_LATEX: :mode math :environment bmatrix :math-suffix \times

    ;;图片
    #+ATTR_LATEX: :width 5cm :options angle=90
    [[./img/sed-hr4049.pdf]]
    #+ATTR_LATEX: :caption \bicaption{HeadingA}{HeadingB}
    [[./img/sed-hr4049.pdf]]

# 快捷键<a id="sec-4" name="sec-4"></a>

## Base<a id="sec-4-1" name="sec-4-1"></a>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="left" />

<col  class="left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Move</th>
<th scope="col" class="left">C-S-down</th>
<th scope="col" class="left">往下移动行</th>
</tr>


<tr>
<th scope="col" class="left">&#xa0;</th>
<th scope="col" class="left">C-e</th>
<th scope="col" class="left">去到行尾</th>
</tr>


<tr>
<th scope="col" class="left">&#xa0;</th>
<th scope="col" class="left">M-up/down</th>
<th scope="col" class="left">html模式当中, 按标签对上下移动</th>
</tr>


<tr>
<th scope="col" class="left">&#xa0;</th>
<th scope="col" class="left">C-a</th>
<th scope="col" class="left">返回到行首</th>
</tr>


<tr>
<th scope="col" class="left">&#xa0;</th>
<th scope="col" class="left">C-l</th>
<th scope="col" class="left">调整当前光标所在行为屏幕最上面或中间或最下面</th>
</tr>


<tr>
<th scope="col" class="left">&#xa0;</th>
<th scope="col" class="left">M-></th>
<th scope="col" class="left">跳转到页面最后</th>
</tr>


<tr>
<th scope="col" class="left">&#xa0;</th>
<th scope="col" class="left">M-<</th>
<th scope="col" class="left">跳转到文件最头</th>
</tr>


<tr>
<th scope="col" class="left">&#xa0;</th>
<th scope="col" class="left">M-n/p</th>
<th scope="col" class="left">跳转块,跳转到下一个空行；</th>
</tr>


<tr>
<th scope="col" class="left">&#xa0;</th>
<th scope="col" class="left">C-c C-f</th>
<th scope="col" class="left">Go to next line and make the point at the end of this line</th>
</tr>


<tr>
<th scope="col" class="left">&#xa0;</th>
<th scope="col" class="left">C-c C-b</th>
<th scope="col" class="left">Back to above line make the point at the end o fthis liner</th>
</tr>


<tr>
<th scope="col" class="left">&#xa0;</th>
<th scope="col" class="left">C-S n/p/b/f</th>
<th scope="col" class="left">一次性移动5格</th>
</tr>


<tr>
<th scope="col" class="left">&#xa0;</th>
<th scope="col" class="left">M-i</th>
<th scope="col" class="left">返回到本行的缩进位置</th>
</tr>


<tr>
<th scope="col" class="left">&#xa0;</th>
<th scope="col" class="left">C-v</th>
<th scope="col" class="left">向下移动一页</th>
</tr>


<tr>
<th scope="col" class="left">&#xa0;</th>
<th scope="col" class="left">M-v</th>
<th scope="col" class="left">向上移动一页</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">Select</td>
<td class="left">C-></td>
<td class="left">向下选择多个光标</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-<</td>
<td class="left">向上选择多个光标</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c h</td>
<td class="left">全选</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-RET</td>
<td class="left">进入矩形编辑，然后C-n/p可以选择</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-S 鼠标点击</td>
<td class="left">通过鼠标点击选择多个光标</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Windows</td>
<td class="left">C-x 1</td>
<td class="left">只显示当前窗口，关闭其它窗口</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-x 2</td>
<td class="left">上下方式打开一个新窗口</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-x 3</td>
<td class="left">左右方式打开一个新窗口</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-x o</td>
<td class="left">选择窗口</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-x 0</td>
<td class="left">关闭当前窗口</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-x 5</td>
<td class="left">切换当前buffer到指定的windows中</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Edit</td>
<td class="left">C-c d</td>
<td class="left">复制当前行</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c b</td>
<td class="left">新建一个文件并打开buffer</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c c</td>
<td class="left">注释/取消注释</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-;</td>
<td class="left">选择，然后打注释</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-RET</td>
<td class="left">下面新建一行并自动缩进</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-o</td>
<td class="left">新建一行并自动缩进，但光标不变化</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-k</td>
<td class="left">删除光标后面的内容，html模式中可直接删除整个tag集</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-S-k</td>
<td class="left">不管光标在哪，删除此行且光标移动到缩进首</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-w</td>
<td class="left">复制当前行，不用选择也不用移动到行首</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-h</td>
<td class="left">删除已经选择的内容，删除内容</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-S-i</td>
<td class="left">缩进已经选择的或当前行</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-j</td>
<td class="left">将上一行缩进到本行后面</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-;</td>
<td class="left">当前系统剪贴版</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-u</td>
<td class="left">大写转换</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-q</td>
<td class="left">对长的行进行自动折行处理</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-h</td>
<td class="left">删除退格键</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-y</td>
<td class="left">粘贴内容</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-x C-y</td>
<td class="left">选择性粘贴内容,打开剪贴板</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-x C-q</td>
<td class="left">只读与非只读之间切换</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Search</td>
<td class="left">C-s</td>
<td class="left">往后搜索</td>
</tr>


<tr>
<td class="left">Replace</td>
<td class="left">C-s M-i</td>
<td class="left">打开小窗口进行搜索</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-r</td>
<td class="left">往前搜索</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-%</td>
<td class="left">查找替换, y替换，n不替换，q退出，！替换后面所有</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Register</td>
<td class="left">C-x r SPC [number/charactor]</td>
<td class="left">将当前光标所在位置注册到Register中</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-x r j [number/charactor]</td>
<td class="left">跳转到register对应记录所在的位置</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-x r s [number/charactor]</td>
<td class="left">将选择的区域存储到register中</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-x r i [number/charactor]</td>
<td class="left">将register中的对应内容插入到当前光标位置处</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-u C-x r s [number/charactor]</td>
<td class="left">将选择的区域剪切到register中</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Narrow</td>
<td class="left">C-x n n</td>
<td class="left">将选定区域获取新编辑窗口</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-x n p</td>
<td class="left">将当前页面获取进入narrow窗口</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-x n d</td>
<td class="left">将当前方法获取进入narrow窗口</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-x n w</td>
<td class="left">取消narrow</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">View mode</td>
<td class="left">M-x view-mode</td>
<td class="left">进入查看模式</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">SPC</td>
<td class="left">在查看模式向下滚动</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">S-SPC</td>
<td class="left">在查看模式向上滚动</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">q</td>
<td class="left">退出查看模式，并回到启动viewmode的位置</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">e</td>
<td class="left">退出查看模式，并保持当前的光标位置</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Follow mode</td>
<td class="left">C-x 3 M-x follow-mode</td>
<td class="left">打开一个新窗口，并启动follow-mode</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-x follow-mode</td>
<td class="left">关闭follow-mode</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Mark</td>
<td class="left">C-M-,</td>
<td class="left">将当前行设置一个mark，可以通过C-M-<进行退回</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-M-<</td>
<td class="left">退回到上一个mark的行，用于快速返回</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-M-></td>
<td class="left">取消所有的mark，用于对mark进行初使化</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Emacs</td>
<td class="left">C-x r q</td>
<td class="left">快速退出emacs</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-x C-c</td>
<td class="left">退出emacs标准版</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-s</td>
<td class="left">保存当前文件</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-[</td>
<td class="left">扩大当前窗口</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-]</td>
<td class="left">缩小当前窗口</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-x C-=</td>
<td class="left">放大当前buffer字体</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-x M-=</td>
<td class="left">缩小当前buffer字体</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-x C-0</td>
<td class="left">返回原来buffer字体大小（zoom-frm-in/out可以对整个frm的字体进行放大缩小，zoom-in/out功能相同）</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-x C--</td>
<td class="left">切换当前窗口内buffer的顺序</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-x -</td>
<td class="left">切换当前窗口之间的结构，横向切换为纵向，反之</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-x C-w</td>
<td class="left">另存为</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-x RET</td>
<td class="left">放大窗口/缩小窗口</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-x b</td>
<td class="left">切换文件</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Smart</td>
<td class="left">C-'</td>
<td class="left">智能选择区域,适用于如csc, js, html等代码模式，org模式则为打开另一个org模式文件</td>
</tr>


<tr>
<td class="left">selection</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">HTML-edit</td>
<td class="left">M-up/down</td>
<td class="left">Tags成对移动</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Shell</td>
<td class="left">C-z</td>
<td class="left">打开shell-mode</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Eval</td>
<td class="left">M-:</td>
<td class="left">打开eval功能，查找emacs接口文档</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Help</td>
<td class="left">M-x helm-M-x</td>
<td class="left">查看command键映射</td>
</tr>


<tr>
<td class="left">Fundamental</td>
<td class="left">C-c '</td>
<td class="left">进入代码的编译fundamental模式（小窗口）</td>
</tr>
</tbody>
</table>

## Org-mode<a id="sec-4-2" name="sec-4-2"></a>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="left" />

<col  class="left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">分类</th>
<th scope="col" class="left">快捷键</th>
<th scope="col" class="left">说明</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">org-mode</td>
<td class="left">C-RET</td>
<td class="left">加入同级别索引</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-RET</td>
<td class="left">加入同级别的列表</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-t</td>
<td class="left">设置TODO标签</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-left/M-right</td>
<td class="left">修改任务等级，子任务不跟着变化</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-S-up/down</td>
<td class="left">调整此任务节点等级，子任务跟着变化</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c -</td>
<td class="left">更换列表标记(循环)</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-S-RET</td>
<td class="left">新增一个子项</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-up/M-down</td>
<td class="left">调整此任务节点的顺序</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">outline</td>
<td class="left">C-c C-p</td>
<td class="left">上一个标题</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-n</td>
<td class="left">下一下</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-f</td>
<td class="left">同一级的上一个</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-b</td>
<td class="left">同一级的下一个</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-u</td>
<td class="left">回到上一级标题</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-j</td>
<td class="left">跳转标题</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">column</td>
<td class="left">C-c C-x C-c</td>
<td class="left">打开column视图模式</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">r</td>
<td class="left">刷新</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">q</td>
<td class="left">退出</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left"><left> <right> <up> <down></td>
<td class="left">视图之间跳转</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">v</td>
<td class="left">查看属性完整值</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-x i</td>
<td class="left">插入column视图在文件中</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-x C-u</td>
<td class="left">更新column视图中的值，需要进入表格中执行</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-u C-c C-x C-u</td>
<td class="left">更新此文件中所有的column视图内容</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Property</td>
<td class="left">C-c C-x p</td>
<td class="left">设置一个属性</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-x p COLUMN</td>
<td class="left">设置column，内容可以为%25ITEM 10%ITEM 5%TODO 30%SCEDULE 30%DEADLINE</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Tags</td>
<td class="left">C-c C-c C-c</td>
<td class="left">打开tag选择窗口，然后通过字母索引选择tag</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">SPC</td>
<td class="left">清除所有tag</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-c</td>
<td class="left">可以直接输入tag的单词直接进行选择</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-x C-c</td>
<td class="left">打开列展示视图</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">q</td>
<td class="left">退出列视图</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Planning</td>
<td class="left">C-c .</td>
<td class="left">设置时间</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">S-left/S-right</td>
<td class="left">在日历中选择时间</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-n/M-p</td>
<td class="left">设置任务的优先级</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-s</td>
<td class="left">设置任务开始时间, schedlued</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-d</td>
<td class="left">设置任务结束时间，deadline</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c / d</td>
<td class="left">显示警告天数之内的Deadline任务</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-u C-c / d</td>
<td class="left">显示所有的deadline任务</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-1 C-c / d</td>
<td class="left">查看一天之内接近的deadline任务列表</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c / b</td>
<td class="left">查看指定日期之前的deadline, schedule任务列表</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c / a</td>
<td class="left">查看指定日期之后的deadline, schedule任务列表</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c .</td>
<td class="left">插入时间(Timestamps)</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">S-left/right</td>
<td class="left">光标在时间上时，用于往前一天往后一天调整</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Clocking</td>
<td class="left">C-c C-x C-i</td>
<td class="left">开始clock</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-x C-o</td>
<td class="left">退出clock</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-x C-r</td>
<td class="left">插入clock table</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-x ;</td>
<td class="left">Start a count down time</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Agenda</td>
<td class="left">C-c a</td>
<td class="left">打开agenda view, 然后根据显示视图进行选择性显示</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c [</td>
<td class="left">添加当前文件进入agenda-view-file中</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c ]</td>
<td class="left">删除当前文件从agenda-view-file中</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-x <</td>
<td class="left">强制限制只使用当前文件或当前节点来显示agenda-view</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-x ></td>
<td class="left">取消以上限制</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c a t</td>
<td class="left">显示TODO列表</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c a T</td>
<td class="left">可以指定要显示的状态列表，多个状态使用"竖线"隔开显示</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c a m</td>
<td class="left">匹配 tags and properties</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c a M</td>
<td class="left">匹配搜索的tag</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c a L</td>
<td class="left">采用timeline的方式显示此项目，只能在一个单文件上执行此操作</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c a s</td>
<td class="left">按搜索关键查询</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c a #</td>
<td class="left">列出项目暂停的任务</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-w</td>
<td class="left">导出文件</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Agenda column</td>
<td class="left">C-c C-x C-c</td>
<td class="left">打开column模式在agenda view中</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Capture</td>
<td class="left">C-c c</td>
<td class="left">打开capture</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Export</td>
<td class="left">C-<f12></td>
<td class="left">一次性生成所有目录的org文件为html文件，发布配置见.emacs.d中的配置目录</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-e</td>
<td class="left">导出</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Tables</td>
<td class="left">C-c -</td>
<td class="left">在下面添加水平线</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c RET</td>
<td class="left">添加水平线并跳转到下一行</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-m</td>
<td class="left">在本列下面添加一行</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-S-Right</td>
<td class="left">在本列后面添加一列</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-S-Down</td>
<td class="left">在本行上面添加一行</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-S-Left</td>
<td class="left">删除本列</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-S-UP</td>
<td class="left">删除本行</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-left/right</td>
<td class="left">移动列</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-Up/Down</td>
<td class="left">移动行</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-c</td>
<td class="left">重新定义表格</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c \`</td>
<td class="left">修改隐藏的表格中的内容</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">TAB</td>
<td class="left">跳转下一个单元格</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-a / S-tab</td>
<td class="left">跳转到上一个单元格</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c SPAC</td>
<td class="left">清除当前单元格内容</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Aligns</td>
<td class="left">M-x cfs-switch-profile</td>
<td class="left">修改一下当前buffer使用的字体profile，表格对齐需要按中英文字体宽度相同配置</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-x cfs-edit-profile</td>
<td class="left">修改当前profile的配置，可以在修改字体和大小后，在对应的字体大小行上，执行C-c C-c测试</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-x cfs-increase-fontsize</td>
<td class="left">放大字体，按等宽方式放大，已经绑定快捷键C-x C-=</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-x cfs-decrease-fontsize</td>
<td class="left">缩小字体，按等宽方式缩小，已经绑定快捷键C-x M-=</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Archive</td>
<td class="left">C-c C-x a</td>
<td class="left">内部归档，将本任务下的所有子任务标识为灰色，默认将是不可打开的状态，可以通过C-TAB进行打开</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-TAB</td>
<td class="left">打开内部归档后的任务</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-x A</td>
<td class="left">将此任务迁移入一个名为"Archive"的标记条下</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-x C-a</td>
<td class="left">将此任务迁移到与当前文件名相同名称+\_archive的文件中</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-x C-s</td>
<td class="left">同上</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Refile</td>
<td class="left">C-c C-w</td>
<td class="left">将此标签任务迁移到其它文件中</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c M-w</td>
<td class="left">同上，并保留当前文件内容</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>
</tbody>
</table>

## 宏<a id="sec-4-3" name="sec-4-3"></a>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="left" />

<col  class="left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">宏</th>
<th scope="col" class="left">C-x (</th>
<th scope="col" class="left">开始录制宏</th>
</tr>


<tr>
<th scope="col" class="left">&#xa0;</th>
<th scope="col" class="left">C-x )</th>
<th scope="col" class="left">结束录制宏</th>
</tr>


<tr>
<th scope="col" class="left">&#xa0;</th>
<th scope="col" class="left">C-x e</th>
<th scope="col" class="left">使用宏</th>
</tr>


<tr>
<th scope="col" class="left">&#xa0;</th>
<th scope="col" class="left">C-u</th>
<th scope="col" class="left">重复使用宏，C-u 100 C-x e重复100次</th>
</tr>


<tr>
<th scope="col" class="left">&#xa0;</th>
<th scope="col" class="left">M-x name-last-kbd-macro</th>
<th scope="col" class="left">保存宏，可以在其它地方通过M-x调用此保存好的宏</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>
</tbody>
</table>

## Dired<a id="sec-4-4" name="sec-4-4"></a>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">
<caption class="t-above"><span class="table-number">Table 1:</span> Dired快捷键</caption>

<colgroup>
<col  class="left" />

<col  class="left" />

<col  class="left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">类别</th>
<th scope="col" class="left">快捷键</th>
<th scope="col" class="left">描述</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">基本</td>
<td class="left">C-x d</td>
<td class="left">启动dired</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">;</td>
<td class="left">切换View-mode与Dired-mode，View-mode可以通过首字母定位文件名，Dired-mode下可以使用快捷键</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Dired-mode</td>
<td class="left">n/p</td>
<td class="left">上一个，下一个</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">$</td>
<td class="left">隐藏/显示目录结构</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">p</td>
<td class="left">上一个文件夹/文件</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">n</td>
<td class="left">下一个文件夹/文件</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">q</td>
<td class="left">返回目录</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">o</td>
<td class="left">另一个窗口打开文件</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">g</td>
<td class="left">刷新当前目录</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">l</td>
<td class="left">列出当前详细信息</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">&#xa0;</td>
<td class="left">m</td>
<td class="left">标记当前文件夹/文件</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">t</td>
<td class="left">标记所有</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">u</td>
<td class="left">取消标记</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">d</td>
<td class="left">标记为删除</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">R</td>
<td class="left">重命名</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">&#xa0;</td>
<td class="left">X</td>
<td class="left">删除</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">k</td>
<td class="left">移动到回收站</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">R</td>
<td class="left">移动或重命名</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C</td>
<td class="left">复制</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">+</td>
<td class="left">新建文件夹</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-x C-f</td>
<td class="left">新建文件</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">&#xa0;</td>
<td class="left">M</td>
<td class="left">改变权限</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">O</td>
<td class="left">改变用户</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">&#xa0;</td>
<td class="left">M-g</td>
<td class="left">在marked文件上执行grep命令进行查看文件代码</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-x C-h</td>
<td class="left">显示隐藏文件（默认配置了不显示）</td>
</tr>
</tbody>
</table>

## Tern<a id="sec-4-5" name="sec-4-5"></a>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">
<caption class="t-above"><span class="table-number">Table 2:</span> Tern快捷键</caption>

<colgroup>
<col  class="left" />

<col  class="left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">快捷键</th>
<th scope="col" class="left">描述</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">M-.</td>
<td class="left">跳转到当前所在的参数或方法的定义位置</td>
</tr>


<tr>
<td class="left">M-,</td>
<td class="left">返回刚在执行M-.的位置</td>
</tr>


<tr>
<td class="left">C-c C-c</td>
<td class="left">重命名当前变量</td>
</tr>


<tr>
<td class="left">C-c C-d</td>
<td class="left">找到当前变量的文档，再按就是打开它的文档中的URL</td>
</tr>


<tr>
<td class="left">C-<tab></td>
<td class="left">自动提示</td>
</tr>
</tbody>
</table>

## Wanderlust # Removed package, using mutt instead<a id="sec-4-6" name="sec-4-6"></a>

查看官方文档：<http://www.gohome.org/wl/doc/wl_toc.html>；

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">
<caption class="t-above"><span class="table-number">Table 3:</span> 快捷键</caption>

<colgroup>
<col  class="left" />

<col  class="left" />

<col  class="left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">类别</th>
<th scope="col" class="left">键位</th>
<th scope="col" class="left">功能描述</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">Summary</td>
<td class="left">l</td>
<td class="left">打开/关闭左边的目录导航</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">f</td>
<td class="left">打开unread的summary</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">SPAC/RET</td>
<td class="left">查看邮件内容</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">n</td>
<td class="left">查看下一条邮件</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">p</td>
<td class="left">查看上一条邮件</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">S-n</td>
<td class="left">查看下一条未查看邮件</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">S-p</td>
<td class="left">查看上一条未查看邮件</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">S-s</td>
<td class="left">按字段进行邮件排序</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">j</td>
<td class="left">进入到详情页面或列表页面</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Draft</td>
<td class="left">w</td>
<td class="left">新建邮件</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">a</td>
<td class="left">回复邮件，只回复发邮件的人</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-u A</td>
<td class="left">回复所有</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-a</td>
<td class="left">回复全部，与上相同</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-x C-s</td>
<td class="left">保存</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-x Tab</td>
<td class="left">添加附件</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-c</td>
<td class="left">发送邮件</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-x C-k</td>
<td class="left">删除当前</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-s</td>
<td class="left">发送并不删除draft</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-o</td>
<td class="left">打开其它的draft如果有</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">Address Manager</td>
<td class="left">C-c C-a</td>
<td class="left">进入地址管理</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">t</td>
<td class="left">添加To</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">c</td>
<td class="left">添加Cc</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">u</td>
<td class="left">取消添加</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">b</td>
<td class="left">添加Bcc</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">x</td>
<td class="left">添加to, cc, bcc, 并退出address manager</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">q</td>
<td class="left">退出地址管理</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">a</td>
<td class="left">添加entry</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">d</td>
<td class="left">删除entry</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">e</td>
<td class="left">修改entry</td>
</tr>
</tbody>
</table>

## Projectile & helm<a id="sec-4-7" name="sec-4-7"></a>

Project address: <https://github.com/bbatsov/projectile>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">
<caption class="t-above"><span class="table-number">Table 4:</span> 绑定helm后的快捷键</caption>

<colgroup>
<col  class="left" />

<col  class="left" />

<col  class="left" />

<col  class="left" />

<col  class="left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">分类</th>
<th scope="col" class="left">快捷键</th>
<th scope="col" class="left">描述</th>
<th scope="col" class="left">掌握重点</th>
<th scope="col" class="left">&#xa0;</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">基本查找</td>
<td class="left">C-c p h/C-c h</td>
<td class="left">打开helm-projectile，查看当前管理的所有项目及文件的全局搜索</td>
<td class="left">常用</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c p d</td>
<td class="left">查找项目中的文件夹</td>
<td class="left">常用</td>
<td class="left">需要在helm项目视图下执行</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c p e</td>
<td class="left">打开近期打开的文件</td>
<td class="left">常用</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c p a</td>
<td class="left">打开当前名称相同的另一个后缀不相同的文件（js/css名称相同时用）</td>
<td class="left">常用</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c p i</td>
<td class="left">刷新项目文件缓存</td>
<td class="left">有时</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c p z</td>
<td class="left">将当前文件添加到项目中</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">项目管理</td>
<td class="left">C-c p p</td>
<td class="left">当配置helm直接接管projectile后，可以直接用projectile项目切换快捷键</td>
<td class="left">常用</td>
<td class="left">以下命令是在项目视图下执行对应的Action</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-d</td>
<td class="left">使用Dired打开项目地址目录</td>
<td class="left">常用</td>
<td class="left">需要在helm项目视图下执行</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-g</td>
<td class="left">打开项目root目录</td>
<td class="left">常用</td>
<td class="left">需要在helm项目视图下执行</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-e</td>
<td class="left">在项目中打开Eshell</td>
<td class="left">&#xa0;</td>
<td class="left">需要在helm项目视图下执行</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-s</td>
<td class="left">使用grep命令</td>
<td class="left">&#xa0;</td>
<td class="left">需要在helm项目视图下执行</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-u C-s</td>
<td class="left">使用grep进行递归查找</td>
<td class="left">&#xa0;</td>
<td class="left">需要在helm项目视图下执行</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c</td>
<td class="left">执行编译命令（可配置）</td>
<td class="left">&#xa0;</td>
<td class="left">需要在helm项目视图下执行</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-D</td>
<td class="left">删除项目</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">文件管理</td>
<td class="left">C-c p f</td>
<td class="left">在项目中查找文件</td>
<td class="left">常用</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-SPC</td>
<td class="left">标记当前文件</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-a</td>
<td class="left">标记所有文件</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c o</td>
<td class="left">在新窗口中打开文件</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-o</td>
<td class="left">用新frame打开文件</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-x</td>
<td class="left">使用外部程序打开文件</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c r</td>
<td class="left">用root打开文件</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-R</td>
<td class="left">对文件进行重命名，通过M-SPC选择文件，通过M-R对文件进行重命名或移动操作</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-C</td>
<td class="left">拷贝文件</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-D</td>
<td class="left">删除文件</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c p g</td>
<td class="left">重新匹配输入的命令，用于在未发现文件时的操作</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">缓冲管理</td>
<td class="left">C-c p b</td>
<td class="left">在项目中切换buffer</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">项目搜索</td>
<td class="left">C-c p s g</td>
<td class="left">项目中搜索内容</td>
<td class="left">常用</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c p s a</td>
<td class="left">使用ack搜索内容</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c p s s</td>
<td class="left">使用ag搜索内容</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">项目管理</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>
</tbody>
</table>

## Projectile<a id="sec-4-8" name="sec-4-8"></a>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">
<caption class="t-above"><span class="table-number">Table 5:</span> Projectile快捷键收集</caption>

<colgroup>
<col  class="left" />

<col  class="left" />
</colgroup>
<tbody>
<tr>
<td class="left">快捷键</td>
<td class="left">描述</td>
</tr>


<tr>
<td class="left">C-c p f</td>
<td class="left">Display a list of all files in the project. With a prefix argument it will clear the cache first.</td>
</tr>


<tr>
<td class="left">C-c p F</td>
<td class="left">Display a list of all files in all known projects.</td>
</tr>


<tr>
<td class="left">C-c p g</td>
<td class="left">Display a list of all files at point in the project. With a prefix argument it will clear the cache first.</td>
</tr>


<tr>
<td class="left">C-c p 4 f</td>
<td class="left">Jump to a project's file using completion and show it in another window.</td>
</tr>


<tr>
<td class="left">C-c p 4 g</td>
<td class="left">Jump to a project's file based on context at point and show it in another window.</td>
</tr>


<tr>
<td class="left">C-c p d</td>
<td class="left">Display a list of all directories in the project. With a prefix argument it will clear the cache first.</td>
</tr>


<tr>
<td class="left">C-c p 4 d</td>
<td class="left">Switch to a project directory and show it in another window.</td>
</tr>


<tr>
<td class="left">C-c p 4 a</td>
<td class="left">Switch between files with the same name but different extensions in other window.</td>
</tr>


<tr>
<td class="left">C-c p T</td>
<td class="left">Display a list of all test files(specs, features, etc) in the project.</td>
</tr>


<tr>
<td class="left">C-c p l</td>
<td class="left">Display a list of all files in a directory (that's not necessarily a project)</td>
</tr>


<tr>
<td class="left">C-c p s g</td>
<td class="left">Run grep on the files in the project.</td>
</tr>


<tr>
<td class="left">M&#x2013; C-c p s g</td>
<td class="left">Run grep on projectile-grep-default-files in the project.</td>
</tr>


<tr>
<td class="left">C-c p v</td>
<td class="left">Run vc-dir on the root directory of the project.</td>
</tr>


<tr>
<td class="left">C-c p b</td>
<td class="left">Display a list of all project buffers currently open.</td>
</tr>


<tr>
<td class="left">C-c p 4 b</td>
<td class="left">Switch to a project buffer and show it in another window.</td>
</tr>


<tr>
<td class="left">C-c p 4 C-o</td>
<td class="left">Display a project buffer in another window without selecting it.</td>
</tr>


<tr>
<td class="left">C-c p a</td>
<td class="left">Switch between files with the same name but different extensions.</td>
</tr>


<tr>
<td class="left">C-c p o</td>
<td class="left">Runs multi-occur on all project buffers currently open.</td>
</tr>


<tr>
<td class="left">C-c p r</td>
<td class="left">Runs interactive query-replace on all files in the projects.</td>
</tr>


<tr>
<td class="left">C-c p i</td>
<td class="left">Invalidates the project cache (if existing).</td>
</tr>


<tr>
<td class="left">C-c p R</td>
<td class="left">Regenerates the projects TAGS file.</td>
</tr>


<tr>
<td class="left">C-c p j</td>
<td class="left">Find tag in project's TAGS file.</td>
</tr>


<tr>
<td class="left">C-c p k</td>
<td class="left">Kills all project buffers.</td>
</tr>


<tr>
<td class="left">C-c p D</td>
<td class="left">Opens the root of the project in dired.</td>
</tr>


<tr>
<td class="left">C-c p e</td>
<td class="left">Shows a list of recently visited project files.</td>
</tr>


<tr>
<td class="left">C-c p s s</td>
<td class="left">Runs ag on the project. Requires the presence of ag.el.</td>
</tr>


<tr>
<td class="left">C-c p !</td>
<td class="left">Runs shell-command in the root directory of the project.</td>
</tr>


<tr>
<td class="left">C-c p &</td>
<td class="left">Runs async-shell-command in the root directory of the project.</td>
</tr>


<tr>
<td class="left">C-c p c</td>
<td class="left">Runs a standard compilation command for your type of project.</td>
</tr>


<tr>
<td class="left">C-c p P</td>
<td class="left">Runs a standard test command for your type of project.</td>
</tr>


<tr>
<td class="left">C-c p t</td>
<td class="left">Toggle between an implementation file and its test file.</td>
</tr>


<tr>
<td class="left">C-c p 4 t</td>
<td class="left">Jump to implementation or test file in other window.</td>
</tr>


<tr>
<td class="left">C-c p z</td>
<td class="left">Adds the currently visited file to the cache.</td>
</tr>


<tr>
<td class="left">C-c p p</td>
<td class="left">Display a list of known projects you can switch to.</td>
</tr>


<tr>
<td class="left">C-c p S</td>
<td class="left">Save all project buffers.</td>
</tr>


<tr>
<td class="left">C-c p m</td>
<td class="left">Run the commander (an interface to run commands with a single key).</td>
</tr>


<tr>
<td class="left">C-c p ESC</td>
<td class="left">Switch to the most recently selected projectile buffer.</td>
</tr>
</tbody>
</table>

## SMIX<a id="sec-4-9" name="sec-4-9"></a>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">
<caption class="t-above"><span class="table-number">Table 6:</span> SMIX快捷键</caption>

<colgroup>
<col  class="left" />

<col  class="left" />

<col  class="left" />
</colgroup>
<tbody>
<tr>
<td class="left">类别</td>
<td class="left">快捷键</td>
<td class="left">描述</td>
</tr>


<tr>
<td class="left">SMIX</td>
<td class="left">M-x</td>
<td class="left">打开SMIX</td>
</tr>
</tbody>
</table>

## Tabbar<a id="sec-4-10" name="sec-4-10"></a>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">
<caption class="t-above"><span class="table-number">Table 7:</span> Tabbar切换快捷键</caption>

<colgroup>
<col  class="left" />

<col  class="left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">快捷键</th>
<th scope="col" class="left">描述</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">C-c t</td>
<td class="left">打开Tabbar的模式，接下来可以使用下面的按键切换文件</td>
</tr>


<tr>
<td class="left">C-c C-left/right</td>
<td class="left">切换tab文件</td>
</tr>


<tr>
<td class="left">C-c C-up/down</td>
<td class="left">按group进行切换，启用了自动识别按projectile进行自动分组</td>
</tr>
</tbody>
</table>

## Magit<a id="sec-4-11" name="sec-4-11"></a>

Magit是通过emacs操作git命令的工具

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">
<caption class="t-above"><span class="table-number">Table 8:</span> magit操作快捷键</caption>

<colgroup>
<col  class="left" />

<col  class="left" />

<col  class="left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">类别</th>
<th scope="col" class="left">快捷键</th>
<th scope="col" class="left">描述</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">基本</td>
<td class="left">M-x magit-status</td>
<td class="left">打开magit，查看修改记录</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">s</td>
<td class="left">进入到修改清单中，将此文件加入到staging</td>
</tr>


<tr>
<td class="left">操作清单</td>
<td class="left">c</td>
<td class="left">进入magit操作菜单</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">c</td>
<td class="left">在操作清单中执行commit，输入commit信息</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-c</td>
<td class="left">输入commit信息后，提交</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">P P</td>
<td class="left">推送到远程master, 输入用户名，密码即可提交</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">F F</td>
<td class="left">执行git pull</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">b b</td>
<td class="left">切换到其它的分支</td>
</tr>
</tbody>
</table>

## Latex<a id="sec-4-12" name="sec-4-12"></a>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">
<caption class="t-above"><span class="table-number">Table 9:</span> Latex快捷键</caption>

<colgroup>
<col  class="left" />

<col  class="left" />

<col  class="left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">分类</th>
<th scope="col" class="left">快捷键</th>
<th scope="col" class="left">描述</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">基本命令</td>
<td class="left">C-c C-e</td>
<td class="left">打开操作面板</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">l p</td>
<td class="left">导出</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-u C-c C-x C-l</td>
<td class="left">预览</td>
</tr>
</tbody>
</table>

## Sunrise Commander<a id="sec-4-13" name="sec-4-13"></a>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">
<caption class="t-above"><span class="table-number">Table 10:</span> Latex快捷键</caption>

<colgroup>
<col  class="left" />

<col  class="left" />

<col  class="left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">分类</th>
<th scope="col" class="left">快捷键</th>
<th scope="col" class="left">描述</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">基本命令</td>
<td class="left">C-c x</td>
<td class="left">打开sunrise窗口</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c X</td>
<td class="left">打开sunrise-cd窗口</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-x customize-group RET sunrise RET</td>
<td class="left">查看sunrise的命令</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-n</td>
<td class="left">按命名查找</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-g</td>
<td class="left">按代码grep查找</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-f</td>
<td class="left">查找</td>
</tr>
</tbody>
</table>

## Markdown<a id="sec-4-14" name="sec-4-14"></a>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">
<caption class="t-above"><span class="table-number">Table 11:</span> Markdown快捷键</caption>

<colgroup>
<col  class="left" />

<col  class="left" />

<col  class="left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">分类</th>
<th scope="col" class="left">快捷键</th>
<th scope="col" class="left">描述</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">编辑命令</td>
<td class="left">C-c C-t n</td>
<td class="left">插入 hash 样式的标题，其中 n 为 1~5，表示从第一级标题到第五级标题。</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-t t</td>
<td class="left">插入 underline 样式的标题，这是一级。</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-t s</td>
<td class="left">同上，这是二级。</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-a l</td>
<td class="left">插入链接，格式为 [text](url)。</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-i i</td>
<td class="left">插入图像，格式为 \\![text](url)。</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-s b</td>
<td class="left">插入引用内容。</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-s c</td>
<td class="left">插入代码。</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-p b</td>
<td class="left">加粗。</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-p i</td>
<td class="left">斜体。</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c -</td>
<td class="left">插入水平线。</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">大纲模式</td>
<td class="left">S-Tab</td>
<td class="left">在大纲视图、目录视图、及正常视图间切换</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="left">预览</td>
<td class="left">C-c C-c m</td>
<td class="left">在当前缓冲运行 Markdown，并在另一个缓冲预览</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c C-c p</td>
<td class="left">同上，但在浏览器中预览</td>
</tr>
</tbody>
</table>

## Graphviz-dot-mode<a id="sec-4-15" name="sec-4-15"></a>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">
<caption class="t-above"><span class="table-number">Table 12:</span> Graphviz-dot快捷键</caption>

<colgroup>
<col  class="left" />

<col  class="left" />

<col  class="left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">分类</th>
<th scope="col" class="left">快捷键</th>
<th scope="col" class="left">描述</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">编辑命令</td>
<td class="left">C-c c</td>
<td class="left">compile</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-c p</td>
<td class="left">viewing an generated image</td>
</tr>
</tbody>
</table>

## Read Code<a id="sec-4-16" name="sec-4-16"></a>

-   生成tag文件：

    find . -name "*.[chCHS]" | etags -

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">
<caption class="t-above"><span class="table-number">Table 13:</span> 阅读源码快捷键</caption>

<colgroup>
<col  class="left" />

<col  class="left" />

<col  class="left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">分类</th>
<th scope="col" class="left">快捷键</th>
<th scope="col" class="left">描述</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">打开文件</td>
<td class="left">M-x visit-tag-table</td>
<td class="left">选择刚生成的TAGS文件</td>
</tr>


<tr>
<td class="left">编辑命令</td>
<td class="left">M-.</td>
<td class="left">查找光标所指向的函数的定义</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-M-.</td>
<td class="left">输入函数名，查找其定义</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">M-\*</td>
<td class="left">回退</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">C-u M-.</td>
<td class="left">查找标签的下一个定义</td>
</tr>
</tbody>
</table>

## Magit<a id="sec-4-17" name="sec-4-17"></a>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">
<caption class="t-above"><span class="table-number">Table 14:</span> git管理</caption>

<colgroup>
<col  class="left" />

<col  class="left" />

<col  class="left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">分类</th>
<th scope="col" class="left">快捷键</th>
<th scope="col" class="left">描述</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">打开</td>
<td class="left">C-x m</td>
<td class="left">打开magit-status</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">?</td>
<td class="left">打开帮助</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">s</td>
<td class="left">提交文件到stage</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">c</td>
<td class="left">提交到本地master</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">P</td>
<td class="left">提交到远程分支</td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">F</td>
<td class="left">执行一次git pull</td>
</tr>
</tbody>
</table>

## Dash<a id="sec-4-18" name="sec-4-18"></a>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">
<caption class="t-above"><span class="table-number">Table 15:</span> Dash操作</caption>

<colgroup>
<col  class="left" />

<col  class="left" />

<col  class="left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">分类</th>
<th scope="col" class="left">快捷键</th>
<th scope="col" class="left">描述</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">打开</td>
<td class="left">C-c D</td>
<td class="left">Search当前文字在dash中</td>
</tr>
</tbody>
</table>

# 包管理器<a id="sec-5" name="sec-5"></a>

### Package List<a id="sec-5-0-1" name="sec-5-0-1"></a>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Package name</th>
<th scope="col" class="left">Markdown</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">Projectile</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">helm-projectile</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">project-codesearch</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">helm</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">wanderlust</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">anything</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">dired+</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">dired-details</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">dired-details+</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">dired-sort</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">expand-region</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">js2-refactor</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">jump-char</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">multifiles</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">multiple-cursors</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">paredit</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">perspective</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">skewer</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">smart-forward</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">smex</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">yasnippet</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">zencoding-mode</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">codesearch</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">boxquote</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">magit</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">simple-httpd</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">height-symbol</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">ido-completing-read+</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">ox-twbs</td>
<td class="left">&#xa0;</td>
</tr>


<tr>
<td class="left">tern</td>
<td class="left"><http://ternjs.net></td>
</tr>


<tr>
<td class="left">tidy</td>
<td class="left">需要安装Tidyhtml工具，并配置~/.tidyrc文件</td>
</tr>


<tr>
<td class="left">Auctex</td>
<td class="left"><http://www.gnu.org/software/auctex/></td>
</tr>


<tr>
<td class="left">Plantuml</td>
<td class="left"><https://github.com/wildsoul/plantuml-mode></td>
</tr>


<tr>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>
</tbody>
</table>

### 需要重点学习的包<a id="sec-5-0-2" name="sec-5-0-2"></a>

1.  Projectile

2.  Helm

3.  Smex

4.  Wanderlust  # has been removed

5.  Org-mode

6.  Markdown

7.  Ido

8.  zencoding-mode

9.  yasnippet

10. dired

11. anything

12. wgrep

13. skewer

14. tern/tern-server

15. ielm

16. helm-css-sass

17. helm-swoop

18. tabbar-ruler

19. Tramp

20. Magit

21. Tidy

22. Speedbar

23. Latex

    -   安装texlive: sudo pacman -S texlive-bin texlive-core texlive-fontsextra texlive-formatextra texlive-langchinese texlive-langcjk texlive-langextra texlive-picture
    -   安装字体：sudo pacman -S adobe-source-han-sans-otc-fonts wqy-microhei
    -   网上下载sim字库：宋体(simsun)、黑体(simhei)、仿宋体(simfang)、楷体(simkai)
    -   确保在org文件上包含了第一节里的header中latex的字体定义

# Supplement<a id="sec-6" name="sec-6"></a>

## Org-mode Key-bindings from official<a id="sec-6-1" name="sec-6-1"></a>

From : <http://orgmode.org/orgcard.txt>

`==============================================================================`
Org-Mode Reference Card (for version 7.8.11)
`==============================================================================`

`==============================================================================`
Getting Started
`==============================================================================`
To read the on-line documentation try             M-x org-info

`==============================================================================`
Visibility Cycling
`==============================================================================`

rotate current subtree between states             TAB
rotate entire buffer between states               S-TAB
restore property-dependent startup visibility     C-u C-u TAB
show the whole file, including drawers            C-u C-u C-u TAB
reveal context around point                       C-c C-r

`==============================================================================`
Motion
`==============================================================================`

next/previous heading                             C-c C-n/p
next/previous heading, same level                 C-c C-f/b
backward to higher level heading                  C-c C-u
jump to another place in document                 C-c C-j
previous/next plain list item                     S-UP/DOWN\notetwo

`==============================================================================`
Structure Editing
`==============================================================================`

insert new heading/item at current level          M-RET
insert new heading after subtree                  C-RET
insert new TODO entry/checkbox item               M-S-RET
insert TODO entry/ckbx after subtree              C-S-RET
turn (head)line into item, cycle item type        C-c -
turn item/line into headline                      C-c \*
promote/demote heading                            M-LEFT/RIGHT
promote/demote current subtree                    M-S-LEFT/RIGHT
move subtree/list item up/down                    M-S-UP/DOWN
sort subtree/region/plain-list                    C-c ^
clone a subtree                                   C-c C-x c
copy visible text                                 C-c C-x v
kill/copy subtree                                 C-c C-x C-w/M-w
yank subtree                                      C-c C-x C-y or C-y
narrow buffer to subtree / widen                  C-x n s/w

`==============================================================================`
Capture - Refile - Archiving
`==============================================================================`
capture a new item (C-u C-u = goto last)          C-c c \noteone
refile subtree (C-u C-u = goto last)              C-c C-w
archive subtree using the default command         C-c C-x C-a
move subtree to archive file                      C-c C-x C-s
toggle ARCHIVE tag / to ARCHIVE sibling           C-c C-x a/A
force cycling of an ARCHIVEd tree                 C-TAB

`==============================================================================`
Filtering and Sparse Trees
`==============================================================================`

construct a sparse tree by various criteria       C-c /
view TODO's in sparse tree                        C-c / t/T
global TODO list in agenda mode                   C-c a t \noteone
time sorted view of current org file              C-c a L

`==============================================================================`
Tables
`==============================================================================`

---

Creating a table

---

just start typing, e.g.                           |Name|Phone|Age RET |- TAB
convert region to table                           C-c |
&#x2026; separator at least 3 spaces                   C-3 C-c |

---

Commands available inside tables

---

The following commands work when the cursor is inside a table.
Outside of tables, the same keys may have other functionality.

---

Re-aligning and field motion

---

re-align the table without moving the cursor      C-c C-c
re-align the table, move to next field            TAB
move to previous field                            S-TAB
re-align the table, move to next row              RET
move to beginning/end of field                    M-a/e

---

Row and column editing

---

move the current column left                      M-LEFT/RIGHT
kill the current column                           M-S-LEFT
insert new column to left of cursor position      M-S-RIGHT

move the current row up/down                      M-UP/DOWN
kill the current row or horizontal line           M-S-UP
insert new row above the current row              M-S-DOWN
insert hline below (C-u : above) current row      C-c -
insert hline and move to line below it            C-c RET
sort lines in region                              C-c ^

---

Regions

---

cut/copy/paste rectangular region                 C-c C-x C-w/M-w/C-y
fill paragraph across selected cells              C-c C-q

---

Miscellaneous

---

to limit column width to N characters, use        &#x2026;| <N> |&#x2026;
edit the current field in a separate window       C-c \`
make current field fully visible                  C-u TAB
export as tab-separated file                      M-x org-table-export
import tab-separated file                         M-x org-table-import
sum numbers in current column/rectangle           C-c +

---

Tables created with the table.el package

---

insert a new table.el table                       C-c ~
recognize existing table.el table                 C-c C-c
convert table (Org-mode <-> table.el)             C-c ~

---

Spreadsheet

---

Formulas typed in field are executed by TAB,
RET and C-c C-c.  = introduces a column
formula, := a field formula.

Example: Add Col1 and Col2                        |=$1+$2      |
&#x2026; with printf format specification              |=$1+$2;%.2f|
&#x2026; with constants from constants.el              |=$1/$c/$cm |
sum from 2nd to 3rd hline                         |:=vsum(@II..@III)|
apply current column formula                      | = |

set and eval column formula                       C-c =
set and eval field formula                        C-u C-c =
re-apply all stored equations to current line     C-c \*
re-apply all stored equations to entire table     C-u C-c \*
iterate table to stability                        C-u C-u C-c \*
rotate calculation mark through # \* ! ^ \_ $       C-#
show line, column, formula reference              C-c ?
toggle grid / debugger                            C-c }/{

---

Formula Editor

---

edit formulas in separate buffer                  C-c '
exit and install new formulas                     C-c C-c
exit, install, and apply new formulas             C-u C-c C-c
abort                                             C-c C-q
toggle reference style                            C-c C-r
pretty-print Lisp formula                         TAB
complete Lisp symbol                              M-TAB
shift reference point                             S-cursor
shift test line for column references             M-up/down
scroll the window showing the table               M-S-up/down
toggle table coordinate grid                      C-c }

`==============================================================================`
Links
`==============================================================================`

globally store link to the current location       C-c l \noteone
insert a link (TAB completes stored links)        C-c C-l
insert file link with file name completion        C-u C-c C-l
edit (also hidden part of) link at point          C-c C-l

open file links in emacs                          C-c C-o
&#x2026;force open in emacs/other window               C-u C-c C-o
open link at point                                mouse-1/2
&#x2026;force open in emacs/other window               mouse-3
record a position in mark ring                    C-c %
jump back to last followed link(s)                C-c &
find next link                                    C-c C-x C-n
find previous link                                C-c C-x C-p
edit code snippet of file at point                C-c '
toggle inline display of linked images            C-c C-x C-v

`==============================================================================`
Working with Code (Babel)
`==============================================================================`

execute code block at point                       C-c C-c
open results of code block at point               C-c C-o
check code block at point for errors              C-c C-v c
insert a header argument with completion          C-c C-v j
view expanded body of code block at point         C-c C-v v
view information about code block at point        C-c C-v I
go to named code block                            C-c C-v g
go to named result                                C-c C-v r
go to the head of the current code block          C-c C-v u
go to the next code block                         C-c C-v n
go to the previous code block                     C-c C-v p
demarcate a code block                            C-c C-v d
execute the next key sequence in the code edit bu C-c C-v x
execute all code blocks in current buffer         C-c C-v b
execute all code blocks in current subtree        C-c C-v s
tangle code blocks in current file                C-c C-v t
tangle code blocks in supplied file               C-c C-v f
ingest all code blocks in supplied file into the  C-c C-v i
switch to the session of the current code block   C-c C-v z
load the current code block into a session        C-c C-v l
view sha1 hash of the current code block          C-c C-v a

`==============================================================================`
Completion
`==============================================================================`

In-buffer completion completes TODO keywords at headline start, TeX
macros after \`\\', option keywords after \`#-', TAGS
after  \`:', and dictionary words elsewhere.

complete word at point                            M-TAB

`==============================================================================`
TODO Items and Checkboxes
`==============================================================================`

rotate the state of the current item              C-c C-t
select next/previous state                        S-LEFT/RIGHT
select next/previous set                          C-S-LEFT/RIGHT
toggle ORDERED property                           C-c C-x o
view TODO items in a sparse tree                  C-c C-v
view 3rd TODO keyword's sparse tree               C-3 C-c C-v

set the priority of the current item              C-c , [ABC]
remove priority cookie from current item          C-c , SPC
raise/lower priority of current item              S-UP/DOWN\notetwo

insert new checkbox item in plain list            M-S-RET
toggle checkbox(es) in region/entry/at point      C-c C-x C-b
toggle checkbox at point                          C-c C-c
update checkbox statistics (C-u : whole file)     C-c #

`==============================================================================`
Tags
`==============================================================================`

set tags for current heading                      C-c C-q
realign tags in all headings                      C-u C-c C-q
create sparse tree with matching tags             C-c   
globally (agenda) match tags at cursor            C-c C-o

`==============================================================================`
Properties and Column View
`==============================================================================`

set property/effort                               C-c C-x p/e
special commands in property lines                C-c C-c
next/previous allowed value                       S-left/right
turn on column view                               C-c C-x C-c
capture columns view in dynamic block             C-c C-x i

quit column view                                  q
show full value                                   v
edit value                                        e
next/previous allowed value                       n/p or S-left/right
edit allowed values list                          a
make column wider/narrower                        > / <
move column left/right                            M-left/right
add new column                                    M-S-right
Delete current column                             M-S-left

`==============================================================================`
Timestamps
`==============================================================================`

prompt for date and insert timestamp              C-c .
like C-c . but insert date and time format        C-u C-c .
like C-c . but make stamp inactive                C-c !
insert DEADLINE timestamp                         C-c C-d
insert SCHEDULED timestamp                        C-c C-s
create sparse tree with all deadlines due         C-c / d
the time between 2 dates in a time range          C-c C-y
change timestamp at cursor Â±1 day                S-RIGHT/LEFT\notetwo
change year/month/day at cursor by Â±1            S-UP/DOWN\notetwo
access the calendar for the current date          C-c >
insert timestamp matching date in calendar        C-c <
access agenda for current date                    C-c C-o
select date while prompted                        mouse-1/RET
toggle custom format display for dates/times      C-c C-x C-t

---

Clocking time

---

start clock on current item                       C-c C-x C-i
stop/cancel clock on current item                 C-c C-x C-o/x
display total subtree times                       C-c C-x C-d
remove displayed times                            C-c C-c
insert/update table with clock report             C-c C-x C-r

`==============================================================================`
Agenda Views
`==============================================================================`

add/move current file to front of agenda          C-c [
remove current file from your agenda              C-c ]
cycle through agenda file list                    C-'
set/remove restriction lock                       C-c C-x </>

compile agenda for the current week               C-c a a \noteone
compile global TODO list                          C-c a t \noteone
compile TODO list for specific keyword            C-c a T \noteone
match tags, TODO kwds, properties                 C-c a m \noteone
match only in TODO entries                        C-c a M \noteone
find stuck projects                               C-c a # \noteone
show timeline of current org file                 C-c a L \noteone
configure custom commands                         C-c a C \noteone
agenda for date at cursor                         C-c C-o

---

Commands available in an agenda buffer

---

---

View Org file

---

show original location of item                    SPC/mouse-3
show and recenter window                          L
goto original location in other window            TAB/mouse-2
goto original location, delete other windows      RET
show subtree in indirect buffer, ded.\\ frame      C-c C-x b
toggle follow-mode                                F

---

Change display

---

delete other windows                              o
view mode dispatcher                              v
switch to day/week/month/year/def view            d w vm vy vSP
toggle diary entries / time grid / habits         D / G / K
toggle entry text / clock report                  E / R
toggle display of logbook entries                 l / v l/L/c
toggle inclusion of archived trees/files          v a/A
refresh agenda buffer with any changes            r / g
filter with respect to a tag                      /
save all org-mode buffers                         s
display next/previous day,week,&#x2026;                f / b
goto today / some date (prompt)                   . / j

---

Remote editing

---

digit argument                                    0-9
change state of current TODO item                 t
kill item and source                              C-k
archive default                                   $ / a
refile the subtree                                C-c C-w
set/show tags of current headline                 : / T
set effort property (prefix=nth)                  e
set / compute priority of current item            , / P
raise/lower priority of current item              S-UP/DOWN\notetwo
run an attachment command                         C-c C-a
schedule/set deadline for this item               C-c C-s/d
change timestamp one day earlier/later            S-LEFT/RIGHT\notetwo
change timestamp to today                         >
insert new entry into diary                       i
start/stop/cancel the clock on current item       I / O / X
jump to running clock entry                       J
mark / unmark / execute bulk action               m / u / B

---

Misc

---

follow one or offer all links in current entry    C-c C-o

---

Calendar commands

---

find agenda cursor date in calendar               c
compute agenda for calendar cursor date           c
show phases of the moon                           M
show sunrise/sunset times                         S
show holidays                                     H
convert date to other calendars                   C

---

Quit and Exit

---

quit agenda, remove agenda buffer                 q
exit agenda, remove all agenda buffers            x

`==============================================================================`
LaTeX and cdlatex-mode
`==============================================================================`

preview LaTeX fragment                            C-c C-x C-l
expand abbreviation (cdlatex-mode)                TAB
insert/modify math symbol (cdlatex-mode)          \` / '
insert citation using RefTeX                      C-c C-x [

`==============================================================================`
Exporting and Publishing
`==============================================================================`

Exporting creates files with extensions .txt and .html
in the current directory.  Publishing puts the resulting file into
some other place.

export/publish dispatcher                         C-c C-e

export visible part only                          C-c C-e v
insert template of export options                 C-c C-e t
toggle fixed width for entry or region            C-c :
toggle pretty display of scripts, entities        C-c C-x {\tt\char\`\\}

---

Comments: Text not being exported

---

Lines starting with # and subtrees starting with COMMENT are
never exported.

toggle COMMENT keyword on entry                   C-c ;

`==============================================================================`
Dynamic Blocks
`==============================================================================`

update dynamic block at point                     C-c C-x C-u
update all dynamic blocks                         C-u C-c C-x C-u

`==============================================================================`
Notes
`==============================================================================`
