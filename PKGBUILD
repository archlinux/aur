# Maintainer: ccat3z <c0ldcat3z@gmail.com>

pkgname=qiniu-qshell-bin
pkgver=2.1.8
pkgrel=1
pkgdesc="qshell是利用七牛文档上公开的API实现的一个方便开发者测试和使用七牛API服务的命令行工具"
arch=('x86_64')
url="https://github.com/qiniu/qshell"
license=('MIT')
source=("http://devtools.qiniu.com/qshell-v${pkgver}.zip")
md5sums=(6dcf0de646582fcbae394ca1979a9bce)

package() {
    install -Dm755 qshell-linux-x64 "${pkgdir}/usr/bin/qshell"
}
