# Maintainer : Aloxaf <aloxafx@gmail.com>
# Contributor: ccat3z <c0ldcat3z@gmail.com>

pkgname=qiniu-qshell-bin
pkgver=2.6.0
pkgrel=1
pkgdesc="CLI tool for Qiniu"
arch=('x86_64')
url="https://github.com/qiniu/qshell"
license=('MIT')
provides=('qshell')
source=("https://github.com/qiniu/qshell/releases/download/v${pkgver}/qshell-v${pkgver}-linux-amd64.tar.gz")
sha256sums=(6a9a71c9fbb5ab8bf46d7ed426f4b8fbd02231fb2981a7946267e216da2dbac1)

package() {
    install -Dm755 "${srcdir}/qshell" "${pkgdir}/usr/bin/qshell"
}
