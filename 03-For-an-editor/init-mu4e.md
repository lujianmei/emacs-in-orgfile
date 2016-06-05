<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Email Reader - Mu4e with Offlineimap and  and msmtp</a>
<ul>
<li>
<ul>
<li><a href="#sec-1-0-1">1.0.1. Offlineimap</a>
<ul>
<li><a href="#sec-1-0-1-1">1.0.1.1. 安装</a></li>
<li><a href="#sec-1-0-1-2">1.0.1.2. 配置</a></li>
<li><a href="#sec-1-0-1-3">1.0.1.3. 配置安全密码</a></li>
</ul>
</li>
<li><a href="#sec-1-0-2">1.0.2. Mu4e</a>
<ul>
<li><a href="#sec-1-0-2-1">1.0.2.1. 安装</a></li>
<li><a href="#sec-1-0-2-2">1.0.2.2. 配置mu4e的emacs配置文件</a></li>
<li><a href="#sec-1-0-2-3">1.0.2.3. 配置mu4e的配置文件</a></li>
</ul>
</li>
<li><a href="#sec-1-0-3">1.0.3. msmtp</a></li>
</ul>
</li>
</ul>
</li>
</ul>
</div>
</div>


# Email Reader - Mu4e with Offlineimap and  and msmtp<a id="sec-1" name="sec-1"></a>

### Offlineimap<a id="sec-1-0-1" name="sec-1-0-1"></a>

#### 安装<a id="sec-1-0-1-1" name="sec-1-0-1-1"></a>

    sudo pacman -Ss offlineimap

#### 配置<a id="sec-1-0-1-2" name="sec-1-0-1-2"></a>

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

#### 配置安全密码<a id="sec-1-0-1-3" name="sec-1-0-1-3"></a>

### Mu4e<a id="sec-1-0-2" name="sec-1-0-2"></a>

mu4e基于mu开发，直接通过maildir格式文件进行读取邮件内容；因此可以通过offlineimap进行邮件下载，然后通过mu4e进行邮件读取及发送邮件即可；
官方网站：[<http://www.djcbsoftware.nl/code/mu>]

#### 安装<a id="sec-1-0-2-1" name="sec-1-0-2-1"></a>

    yaourt -S mu

mac上的安装

    # install email client related
    brew install gnutls
    #install email related
    brew install mu --with-emacs
    brew install offlineimap msmtp
    brew install curl --with-openssl && brew link curl —forc
    brew install html2text w3m

#### 配置mu4e的emacs配置文件<a id="sec-1-0-2-2" name="sec-1-0-2-2"></a>

配置直接通过emacs中的init-mu4e.el文件进行配置；

    ;;================================================================
    ;; Config for email client mu4e
    ;;================================================================
    (message "Start load mu4e configuration")
    (require 'mu4e)
    (require 'smtpmail)
    (require 'starttls)
    
    
    
    ;; Reading email config
    ;;(setq mu4e-maildir "~/.mutt/mails/lu.jianmei")
    (setq mu4e-maildir "~/Maildir/lu.jianmei")
    (setq mu4e-attachment-dir "~/MailAttachments")
    
    (setq mu4e-drafts-folder "/草稿箱"
          mu4e-sent-folder   "/已发送"  ;; config for the sent, drafts folder mapping in Maildir (synced by offlineimap)
          mu4e-trash-folder  "/已删除"
          ;;mu4e-sent-messages-behavior 'delete
          mu4e-get-mail-command "offlineimap"
          mu4e-update-interval 60
          user-mail-address "lu.jianmei@trs.com.cn"
          user-full-name  "Lu Jianmei"
          mu4e-maildir-shortcuts
          '( ("/INBOX"               . ?i)
             ("/haier"   . ?h)
             ("/pm"       . ?p)
             ("/trs"       . ?t)
             ("/已发送"       . ?s)
             ("/me"       . ?m)
             ("/waitting"       . ?w)
             ("/草稿箱"       . ?d)
             ("/已删除"       . ?r)
             ;;("/Gmail/[Gmail].All Mail"    . ?a)
             )
          ;;message-signature
          mu4e-compose-signature
          (concat
           " -- "
           " \n "
           "陆健美 "
           " \n "
           "青岛办项目部 "
           " \n "
           "股票代码：300229 "
           " \n "
           "北京拓尔思信息技术股份有限公司 "
           " \n "
           "Tel：0532-68601852 "
           " \n "
           "Mobile：18661813293 E-mail：lu.jianmei@trs.com.cn "
           " \n "
           "Add：青岛市市南区山东路2号华仁国际大厦12F,G室 266200 "
           " \n "
           "官方网站：www.trs.com.cn "
           "\n")
    
          mu4e-view-show-images t
          mu4e-view-prefer-html t
          ;;; (setq mu4e-html2text-command "html2text")
          ;; mu4e-html2text-command "html2text -utf8 -nobs -width 72"
          ;; when is macos
          ;;; mu4e-html2text-command "textutil -stdin -format html -convert txt -stdout"
          mu4e-html2text-command "w3m -dump -T text/html -M"
          mail-user-agent 'mu4e-user-agent
          ;; don't keep message buffers around
          message-kill-buffer-on-exit t)
    (when (fboundp 'imagemagick-register-types)
      (imagemagick-register-types))
    
    
    ;; ;; Send email config
    ;; (setq message-send-mail-function 'smtpmail-send-it
    ;;       smtpmail-stream-type 'starttls
    ;;       smtpmail-default-smtp-server "smtp.qiye.163.com"
    ;;       smtpmail-smtp-server "smtp.qiye.163.com"
    ;;       smtpmail-smtp-service 25 ;;587(starttls) or 465(tls/ssl) or ?
    
    ;;       ;;tls-program '("gnutls-cli --priority NORMAL:%COMPAT -p %p %h")
    ;;       ;;starttls-gnutls-program "gnutls-cli --priority NORMAL:%COMPAT"
    ;;       starttls-gnutls-program "gnutls"
    ;;       starttls-use-gnutls t
    ;;       smtpmail-debug-info t
    ;;       smtpmail-debug-verb t
    
    ;;       ;;starttls-extra-arguments '("--priority NORMAL:%COMPAT")
    ;;       starttls-extra-arguments '("--insecure")
    ;;       )
    
    ;; otherwise it tries to send through OS associated mail client
    (setq message-send-mail-function 'message-send-mail-with-sendmail)
    ;; we substitute sendmail with msmtp
    (setq sendmail-program "/usr/local/Cellar/msmtp/1.6.2/bin/msmtp")
    ;;need to tell msmtp which account we're using
    ;;(setq message-sendmail-extra-arguments '("--read-envelop-from"))
    (setq message-sendmail-f-is-evil 't)
    
    ;; you might want to set the following too
    
    ;; use helm-mu for search email and contacts etc.
    (use-package helm-mu)
    
    (provide 'init-mu4e)
    ;; init-mu4e.el end here

#### 配置mu4e的配置文件<a id="sec-1-0-2-3" name="sec-1-0-2-3"></a>

完成mu4e的配置后，需要创建~/.authinfo文件，存储所需要的服务器用户名密码等信息；

    machine smtp.qiye.163.com login username password yourpassword

### msmtp<a id="sec-1-0-3" name="sec-1-0-3"></a>

msmtp工具用于发送邮件，mutt的基本配置内容可以参照<https://github.com/lujianmei/.mutt> 上的配置进行处理；

    brew install msmtp
