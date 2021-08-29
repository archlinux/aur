### STM32CubeProgrammer 打包

#### 思路

    使用 `xvfb` 和 `xdotool` 实现自动化启动安装器, 使安装器安装文件到 $pkgdir , 从而打出有用的包

#### 版本号

    下载下来的压缩包文件名: `en.stm32cubeprg-lin_v2-6-0.zip`

    版本号使用了 `-` 来来连接, 这个是不符合[标准](https://wiki.archlinux.org/index.php/PKGBUILD#pkgver)的

    所以 `pkgver` 的值用 `.`分隔, 在使用到文件名时, 对变量做修改即可

    `_pkg_file_name="en.${pkgname}-lin_v${pkgver//./-}.zip"`

#### xvfb

    模拟X环境

    `xvfb-run --auto-servernum --server-args="-screen 0 1920x1080x24" -w 0 ./SetupSTM32CubeProgrammer-2.6.0.linux`

#### xdotool

    1. 模拟点击(左键)

    `xdotool click 1`
Categories=
    2. 获取当前鼠标的位置

    `xdotool getmouselocation`

    3. 移动鼠标到特定的位置并左键点击

    `xdotool mousemove x y click 1`

    4. 模拟输入

    `xdotool type 'helloworld'

    5. 根据标题搜索窗口

    `xdotool search --name 'title'`

#### TODO

    1. desktop entry

    2. icon

    3. create softlink of command line tool 