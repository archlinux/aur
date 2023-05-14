# Maintainer: Johannes Bensmann <johannesbensmann@gmx.de>
pkgname=mouseless
pkgver=0.1.5
pkgrel=1
pkgdesc="Control the mouse with your keyboard and remap keys"
arch=('x86_64')
url="https://github.com/jbensmann/mouseless"
license=('MIT')
depends=()
source=("https://github.com/jbensmann/mouseless/releases/download/v${pkgver}/mouseless-linux-amd64.tar.gz")
sha256sums=('1bb6490820f2491cccb28d3968aa6f1f98c87f1f1416c7f524cc25b0b555d86c')

package() {
    cd "${srcdir}"
    install -Dm755 dist/mouseless "${pkgdir}/usr/bin/mouseless"
}
