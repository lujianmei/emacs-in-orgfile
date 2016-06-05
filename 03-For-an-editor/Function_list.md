<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. 功能模块</a>
<ul>
<li><a href="#sec-1-1">1.1. Checking for manual</a></li>
<li><a href="#sec-1-2">1.2. Org Mode</a>
<ul>
<li><a href="#sec-1-2-1">1.2.1. Property</a></li>
<li><a href="#sec-1-2-2">1.2.2. Column view</a></li>
<li><a href="#sec-1-2-3">1.2.3. Capture</a></li>
<li><a href="#sec-1-2-4">1.2.4. Agenda View</a></li>
</ul>
</li>
<li><a href="#sec-1-3">1.3. Tools in Emacs</a></li>
<li><a href="#sec-1-4">1.4. Emacs Wanderlust</a>
<ul>
<li><a href="#sec-1-4-1">1.4.1. Wanderlust Install</a></li>
<li><a href="#sec-1-4-2">1.4.2. Wanderlust Configuration</a></li>
</ul>
</li>
<li><a href="#sec-1-5">1.5. Eshell</a></li>
<li><a href="#sec-1-6">1.6. Tramp</a></li>
<li><a href="#sec-1-7">1.7. Auctex</a></li>
<li><a href="#sec-1-8">1.8. Latex</a></li>
<li><a href="#sec-1-9">1.9. Plantuml</a></li>
<li><a href="#sec-1-10">1.10. Graphviz</a></li>
<li><a href="#sec-1-11">1.11. Diaat</a></li>
<li><a href="#sec-1-12">1.12. TernJs</a></li>
<li><a href="#sec-1-13">1.13. Sunrise Commander</a></li>
<li><a href="#sec-1-14">1.14. GNUS with Offlineimap and mu4e and msmtp</a>
<ul>
<li><a href="#sec-1-14-1">1.14.1. Offlineimap</a></li>
<li><a href="#sec-1-14-2">1.14.2. Mu4e</a></li>
<li><a href="#sec-1-14-3">1.14.3. msmtp</a></li>
</ul>
</li>
<li><a href="#sec-1-15">1.15. TaskJuggler</a>
<ul>
<li><a href="#sec-1-15-1">1.15.1. 用orgmode写支持tjp的项目任务属性</a></li>
<li><a href="#sec-1-15-2">1.15.2. 项目及资源标记</a></li>
<li><a href="#sec-1-15-3">1.15.3. 导出tjp文件</a></li>
<li><a href="#sec-1-15-4">1.15.4. 修改导出的文件格式或模板</a></li>
</ul>
</li>
</ul>
</li>
</ul>
</div>
</div>


# 功能模块<a id="sec-1" name="sec-1"></a>

## Checking for manual<a id="sec-1-1" name="sec-1-1"></a>

通过emacs可以查看elisp的接口文档，从中间找到各个功能模块的变量定义等；
操作办法： **M-: (info "(elisp) Memory Usage")**

## Org Mode<a id="sec-1-2" name="sec-1-2"></a>

### Property<a id="sec-1-2-1" name="sec-1-2-1"></a>

属性可以用于显示在column视图中，或者agenda view中，增加对任务的描述，描述可以是状态、属性补充等目标；它具有属性的继承性，因此在项目根结点上配置属性后，即可以在子任务中使用这些属性的备选值，使用快捷键进行切换；
-   配置根属性的备选值
    在项目根节点上，配置如下属性，即可以通过 **C-c C-x p** 命令添加一条属性，并将光标定位在属性上后，通过 **S-left/right** 切换所需的属性值；

### Column view<a id="sec-1-2-2" name="sec-1-2-2"></a>

Column view是建立于org-mode任务管理之上的快速以表格查看各个任务情况的视图，可以使用 **C-c C-x C-c** 来打开column view，而此种查看方式只是一种查看，并不会被打印，如果需要通过动态管理column view，并支持打印，可以通过 **C-c C-x i** 插入一个动态的column部分在文件中，但此部分不是动态关联的，即修改了任务内容，插入的column view是不会更新的，但可以通过执行 **C-c C-x C-u** 进行更新；注：已经通过配置(add-hook 'before-save-hook 'org-update-all-dblocks)达到在保存文件时，即会更新文件中所有的column view中的数据；
当需要针对某一个特定的任务组生成一个column view时，可以在此任务组的任务上，执行 **C-c C-x p** 插入属性，选择id，输入一个id值，然后在插入动态column时，选择刚刚输入的id值即可；如果需要对这个表特殊定义不同的column结构，可以再执行 **C-c C-x p** 时选择 **COLUMN** 来重新定义一个新的column结构内容；保存即可自动更新表格；

### Capture<a id="sec-1-2-3" name="sec-1-2-3"></a>

Capture用于快速记录任务或者idea内容，并支持在后面进行capture的内容refile；

### Agenda View<a id="sec-1-2-4" name="sec-1-2-4"></a>

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

## Tools in Emacs<a id="sec-1-3" name="sec-1-3"></a>

-   Ielm Elisp编译器，M-x ielm
-   使配置生效，M-x eval-buffer
-   宏
-   

## Emacs Wanderlust<a id="sec-1-4" name="sec-1-4"></a>

### Wanderlust Install<a id="sec-1-4-1" name="sec-1-4-1"></a>

在Archlinux上有包的管理：因此直接通过sudo命令即可以直接安装；

    sudo pacman -S wanderlust

安装完成后，它可能会在/usr/share/emacs/site-lisp/wl下生成对应的el配置文件；
可以将配置文件拷到对应~/.emacs.d/site-list/wl下；
接着需要安装它的相应的依赖包：elmo, bbdb, semi, w3m, 如果使用ssl协议还需要下载ssl.el文件；
这些包可以在一些相应的网站可以下载：如<http://www.emacswiki.org/上下载>；

### Wanderlust Configuration<a id="sec-1-4-2" name="sec-1-4-2"></a>

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

## Eshell<a id="sec-1-5" name="sec-1-5"></a>

**\***

## Tramp<a id="sec-1-6" name="sec-1-6"></a>

## Auctex<a id="sec-1-7" name="sec-1-7"></a>

\*\*

## Latex<a id="sec-1-8" name="sec-1-8"></a>

## Plantuml<a id="sec-1-9" name="sec-1-9"></a>

<http://www.plantuml.com/>
-   安装依赖
    在archlinux的aur中找到plantuml进行安装；
-   使用，在需要生成的图的位置代码用如何代码框起来

     #+begin_src plantuml :file some_filename.png :cmdline -r -s 0.8
    <context of ditaa source goes here>
     #+end_src

## Graphviz<a id="sec-1-10" name="sec-1-10"></a>

<http://www.graphviz.org/>
-   安装依赖

    sudo pacman -S graphviz

-   使用，在需要生成的图的位置代码用如何代码框起来

    #+begin_src dot :file some_filename.png :cmdline -Kdot -Tpng
       <context of graphviz source goes here>
    #+end_src

## Diaat<a id="sec-1-11" name="sec-1-11"></a>

-   安装依赖

    sudo pacman -S ditaa

-   使用，在需要生成的图的位置代码用如何代码框起来

     #+begin_src ditaa :file some_filename.png :cmdline -r -s 0.8
    <context of ditaa source goes here>
     #+end_src

## TernJs<a id="sec-1-12" name="sec-1-12"></a>

## Sunrise Commander<a id="sec-1-13" name="sec-1-13"></a>

-   说明
    Sunrise是一款类似于dired的命令行的文件管理器，具有大量命令行操作工具；
-   使用方法：显示当前及其子文件夹下所有文件
    press C-c C-f and type:  -not -type d

## GNUS with Offlineimap and mu4e and msmtp<a id="sec-1-14" name="sec-1-14"></a>

### Offlineimap<a id="sec-1-14-1" name="sec-1-14-1"></a>

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

### Mu4e<a id="sec-1-14-2" name="sec-1-14-2"></a>

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

### msmtp<a id="sec-1-14-3" name="sec-1-14-3"></a>

msmtp工具用于发送邮件，mutt的基本配置内容可以参照<https://github.com/lujianmei/.mutt> 上的配置进行处理；

    brew install msmtp

## TaskJuggler<a id="sec-1-15" name="sec-1-15"></a>

taskjuggler是一个出色的项目管理工具，可以支持通过org的todo任务清单，直接导出taskjuggler格式的文件tjp文件，然后可以在安装taskjuggler后，直接通过命令 **tj3 file.tjp** 将生成html项目清单文件；

### 用orgmode写支持tjp的项目任务属性<a id="sec-1-15-1" name="sec-1-15-1"></a>

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

### 项目及资源标记<a id="sec-1-15-2" name="sec-1-15-2"></a>

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

### 导出tjp文件<a id="sec-1-15-3" name="sec-1-15-3"></a>

在org文件上，执行 **C-c C-e J j** 导出此org文件为tjp文件，然后打开终端，执行 **tj3 file.tjp** 即可生成为项目文件；

### 修改导出的文件格式或模板<a id="sec-1-15-4" name="sec-1-15-4"></a>
