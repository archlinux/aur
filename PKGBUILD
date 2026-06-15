# Maintainer : Aloxaf <aloxafx@gmail.com>
# Contributor: ccat3z <c0ldcat3z@gmail.com>

pkgname=qiniu-qshell-bin
pkgver=2.19.8
pkgrel=1
pkgdesc="CLI tool for Qiniu"
arch=('x86_64')
url="https://github.com/qiniu/qshell"
license=('MIT')
provides=('qshell')
source=("https://github.com/qiniu/qshell/releases/download/v${pkgver}/qshell-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('81ae1382c054b9f016d452d6d76adf5584533c57cd93bc788491b2d2044bc74e')

package() {
    install -Dm755 "${srcdir}/qshell" "${pkgdir}/usr/bin/qshell"
}
