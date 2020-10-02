# deepin.com.dingtalk.com（一份非官方的钉钉容器）

> 前言：这份容器我参考了gorquan大佬的[QQMusic](https://github.com/gorquan/QQMusic)项目，很惭愧，未能在疫情开始的时候将其打包出来。

* 当前版本:5.1.28.12

* 更新时间:2020/9/30

* 注意事项

    1. 针对Arch系，我已经打包至AUR，仓库名为```deepin.com.dingtalk.com```

    2. Issue中有人提到manjaro（archlinux或许也有）通过yay更新无法解决输入框无法显示的问题，需要卸载重装，我这里没有做进一步的测试，如果遇到此类问题可以参考[Issue3](https://github.com/zhullyb/deepin.com.dingtalk.com/issues/3#issuecomment-701110857)

    3. 如果你的系统已经拥有deepin-wine5的运行环境，可以尝试切换到deepin-wine5以获得更好的体验

       ```bash
       sudo sed -i "s/deepin-wine/deepin-wine5/" /opt/deepinwine/apps/Deepin-DingTalk/run.sh
       ```

    4. deepin-wine下运行可能会出现图标异常，可以打开设置中的**SVG支持**解决

    5. 基于Debain的发行版可能遇到中文字体显示错误，通过安装中文字体或许可以解决，这里推荐```fonts-wqy-microhei```

    6. Debain系发行版直接安装deb时可能遇上依赖错误，建议直接使用dpkg安装，命令如下：

       ```bash
       sudo dpkg -i XXX.deb
       ```

* Fix
    * 2020/9/30
        * 修复输入框无法显示文字的bug [[3]](https://github.com/zhullyb/deepin.com.dingtalk.com/issues/3)
    
* ISSUE和PR
    * 如果出现了问题或者有什么好的建议，欢迎提出ISSUE，我会及时进行处理
    * 如果有自己的想法且已经实现了，欢迎提交PR

* 打包方式：详细的打包过程可以参考[gorquan大佬的blog](https://blogs.gorquan.cn)，过段时间我会简述自己的打包过程

* 依赖：
    * deepin-wine (>= 2.18-12)
    * deepin-wine32 (>= 2.18-12)
    * deepin-wine32-preloader (>= 2.18-12)
    * deepin-wine-helper (>= 1.2deepin8)
    * deepin-wine-uninstaller (>= 0.1deepin2)

* 感谢名单
    * [钉钉官方](https://www.dingtalk.com/)
    * [deepin-wine](https://www.deepin.org)
    * [wszqkzqk](https://github.com/wszqkzqk/deepin-wine-ubuntu)
    * [gorquan](https://github.com/gorquan)
    
* 最后
    * 该包不涉及任何反编译行为，希望能让更多Linux用户能够用上钉钉客户端，希望官方能够早日研发出Linux平台的钉钉
    * 该包仅限于提供给各位学习使用，请勿用于商业行为！
    * 如果引用包时请带上Github仓库链接，请不要直接占用成果，谢谢合作！
