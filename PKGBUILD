pkgname=ap-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="CLI tool that packs C assignment submissions for Canvas upload"
arch=('x86_64')
url="https://github.com/cat-forgor/AssignmentPacker"
license=('MIT')
provides=('ap')
conflicts=('ap')
source=("https://github.com/cat-forgor/AssignmentPacker/releases/download/v${pkgver}/ap-linux-x64")
sha256sums=('47df19c257e59037217bdb84955d3ae1d4bf3ec42db3147382c82065fc569dc2')

package() {
    install -Dm755 "${srcdir}/ap-linux-x64" "${pkgdir}/usr/bin/ap"
}
