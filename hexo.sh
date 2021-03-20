#!/bin/bash
# Hexo部署脚本
if grep -Eqii "Arch*" /etc/issue /etc/*-release; then
    echo 'OS is Arch'
    read -p "您是否要已经打开github/gitee pages\n y/n :" answer
    if [ $answer == n ]; then
        echo '感谢使用'
    elif [ $answer == y ]; then
	
	read -p "您是否已开启仓库 y/n：" git
        echo '## 必要工具安装'
        sudo pacman -S vim nano git wget curl tar gzip zip rar nodejs-lts-erbium npm --noconfirm

        echo '## npm配置为国内源'
        npm config set registry https://registry.npm.taobao.org

        echo '## 使用npm安装hexo部署工具'
        npm install -g hexo-cli
        npm uninstall --save hexo-generator-category
        npm install --save hexo-renderer-jade hexo-generator-archive hexo-generator-category-enhance hexo-generator-feed hexo-generator-tag
        npm install --save hexo-prism-plugin
        echo '## git账户绑定'
        read -p "## 输入你的github/gitee邮箱地址：" email
        git config --global user.email $email
        read -p "## 请输入你的github/github用户名：" username
        git config --global user.name $username        

        echo '## hexo开始部署......'
        echo '# 基础文件抓取'
        read -p "请输入项目要保存的位置：" project
        mkdir -p ~/$project && cd ~/$project && npm install hexo-deployer-git && wget https://mirrors.yaoyz.cn/hexo/hexo-start.tar && tar -xvf hexo-start.tar && npm install hexo-deployer-git
        rm -r hexo-start.tar
        # 信息读取

        read -p "请输入你的博客标题：" title
        read -p "请输入您对您博客的描述：" description
        read -p "请输入作者name：" author
	    read -p "请输入您的语言（中文zh-Hans 英文en）："  language
        read -p "请输入时区（例Asia/Shanghai）：" timezone
	    read -p "请输入你仓库地址（git结尾）：" repo
        read -p "请输入你的博客地址：" url
	    read -p "请输入你的pages根目录地址 eg: / " root
        echo -e "# Hexo Configuration\n## Docs: https://hexo.io/docs/configuration.html\n## Source: https://github.com/hexojs/hexo/\n \n# Site\ntitle: $title\nsubtitle: ''\ndescription: $description\nkeywords:\nauthor: $author\nlanguage: $language\ntimezone: $timezone\n \n# URL\n## Set your site url here. For example, if you use GitHub Page, set url as 'https://username.github.io/project'\nurl: $url\nroot: $root\npermalink: :year/:month/:day/:title/\npermalink_defaults:\npretty_urls:\n  trailing_index: true # Set to false to remove trailing 'index.html' from permalinks\n  trailing_html: true # Set to false to remove trailing '.html' from permalinks\n \n# Directory\nsource_dir: source\npublic_dir: public\ntag_dir: tags\narchive_dir: archives\ncategory_dir: categories\ncode_dir: downloads/code\ni18n_dir: :lang\nskip_render:\n \n# Writing\nnew_post_name: :title.md # File name of new posts\ndefault_layout: post\ntitlecase: false # Transform title into titlecase\nexternal_link:\n  enable: true # Open external links in new tab\n  field: site # Apply to the whole site\n  exclude: ''\nfilename_case: 0\nrender_drafts: false\npost_asset_folder: false\nrelative_link: false\nfuture: true\nhighlight:\n  enable: false\n  line_number: true\n  auto_detect: false\n  tab_replace: ''\n  wrap: true\n  hljs: false\nprismjs:\n  enable: false\n  preprocess: true\n  line_number: true\n  tab_replace: ''\n \n \n# plugins\nplugin:\n  - hexo-generator-category-enhance\n  - hexo-generator-feed\n  - hexo-asset-image\n  - hexo-prism-plugin\n  - hexo-toc\n \narchive_generator:\n  per_page: 0\n \n \ncategory_generator:\n  per_page: 10\n  enable_index_page: true\n \n \ntag_generator:\n  per_page: 10\n  enable_index_page: true\n \n \n# Generator atom feed for you website\nfeed:\n  type: atom\n  path: atom.xml\n  limit: 20\n  hub:\n  content:\n  content_limit: 140\n  content_limit_delim: ' '\n \n \n# For syntax highlighting\nprism_plugin:\n  mode: 'preprocess'\n  theme: 'default'\n  line_number: true\n \n \n# Home page setting\n# path: Root path for your blogs index page. (default = '')\n# per_page: Posts displayed per page. (0 = disable pagination)\n# order_by: Posts order. (Order by date descending by default)\nindex_generator:\n  path: ''\n  per_page: 10\n  order_by: -date\n \n# Category & Tag\ndefault_category: uncategorized\ncategory_map:\ntag_map:\n \n \n# Metadata elements\n## https://developer.mozilla.org/en-US/docs/Web/HTML/Element/meta\nmeta_generator: true\n \n \n# Date / Time format\n## Hexo uses Moment.js to parse and display date\n# You can customize the date format as defined in\n# http://momentjs.com/docs/#/displaying/format/\ndate_format: YYYY-MM-DD\ntime_format: HH:mm:ss\n## updated_option supports 'mtime', 'date', 'empty'\nupdated_option: 'mtime'\n \n \n# Pagination\n## Set per_page to 0 to disable pagination\nper_page: 10\npagination_dir: page\n \n# Include / Exclude file(s)\n## include:/exclude: options only apply to the 'source/' folder\ninclude:\nexclude:\nignore:\n\n \n \n# Extensions\n## Plugins: https://hexo.io/plugins/\n## Themes: https://hexo.io/themes/\ntheme: typoography\n  \n# Deployment\n## Docs: https://hexo.io/docs/one-command-deployment\ndeploy:\n  type: git\n  repo: $repo\n  branch: master" > _config.yml
        read -p "请输入你在主题下显示的名称：" title1
        read -p "请输入你的标题简介第一行：" title_primary
        read -p "请输入你的标题简介第二行：" title_secondary
        echo -e "title: $title1\ntitle_primary: $title_primary\ntitle_secondary: $title_secondary\nkeywords:\n \nemail:  #E-mail address\nbilibili: #bilibili UID\nsteam: #user name\ntwitter: #username\nrss: atom.xml\nweibo: #username/id\ninstagram: #username\ngithub: \n \n# Choose the comment service according to your need.\n# Please do not use the two services at the same time.\n#livere: # [data-uid] on livere.com\n#disqus: # [short_name] on disqus.com\n#dove: # For fun ONLY. Set to true to 'disable' comments on your site.\n \n# Set true to show the page indicator.\nshowPageCount: true\n \n# Set true to show category or tags behind post titles\nshowCategories: true\nshowTags: true\n \n# Color scheme\nthemeStyle: light # light/dark" > themes/typoography/_config.yml
        npm install --force
        hexo cl && hexo g -d
            
         echo '## 请进入github/gitee pages页面更新'
    else 
        echo 'error 请输入y/n'
        exit
    fi
elif grep -Eqii 'Debian*' /etc/issue /etc/*-release;then
    echo 'OS is Debian'
    echo '作者目前仅编写Arch Linux的脚本'
else
    echo '作者目前仅编写Arch Linux的脚本'
fi

