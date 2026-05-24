# Maintainer: Brandon Greenwell <greenwell.brandon@gmail.com>

pkgname=doxx-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Terminal document viewer for .docx files"
url="https://github.com/bgreenwell/doxx"
license=("MIT")
arch=("x86_64")
provides=("doxx")
conflicts=("doxx")
source=("doxx-${pkgver}.tar.gz::https://github.com/bgreenwell/doxx/releases/download/v${pkgver}/doxx-linux-x86_64.tar.gz")
sha256sums=("ce7dfc549f2160b218665600bd1f172fd5e0a0d207e2a072d4ccf985dddcb210")

package() {
    install -Dm755 "${srcdir}/doxx" -t "${pkgdir}/usr/bin"
}
