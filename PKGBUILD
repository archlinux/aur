# Maintainer : Aloxaf <aloxafx@gmail.com>
# Contributor: ccat3z <c0ldcat3z@gmail.com>

pkgname=qiniu-qshell-bin
pkgver=2.3.6
pkgrel=1
pkgdesc="CLI tool for Qiniu"
arch=('x86_64')
url="https://github.com/qiniu/qshell"
license=('MIT')
provides=('qshell')
source=("http://devtools.qiniu.com/qshell-v${pkgver}.zip")
md5sums=(4f7444f46bd278571532cdbadb5c0989)

package() {
    install -Dm755 qshell_linux_x64 "${pkgdir}/usr/bin/qshell"
}
