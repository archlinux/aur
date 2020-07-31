# Maintainer : Aloxaf <aloxafx@gmail.com>
# Contributor: ccat3z <c0ldcat3z@gmail.com>

pkgname=qiniu-qshell-bin
pkgver=2.4.2
pkgrel=1
pkgdesc="CLI tool for Qiniu"
arch=('x86_64')
url="https://github.com/qiniu/qshell"
license=('MIT')
provides=('qshell')
source=("http://devtools.qiniu.com/qshell-linux-x64-v${pkgver}.zip")
sha256sums=(aaa50ddd5a9c62d810a5463341c7053dafc8ee90511b472450b089a5f70a7a62)

package() {
    install -Dm755 "${srcdir}/qshell-linux-x64-v$pkgver" "${pkgdir}/usr/bin/qshell"
}
