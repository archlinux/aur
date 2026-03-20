# Maintainer: Aboud04 <https://github.com/Aboud04>
pkgname=bento-box
pkgver=0.1.0
pkgrel=1
pkgdesc="A local project vault CLI — compress, stash, and restore project folders"
arch=('x86_64')
url="https://github.com/Aboud04/bento"
license=('MIT')
provides=('bento' 'bt')
conflicts=('bento')
source=("https://github.com/Aboud04/bento/releases/download/v${pkgver}/bento-linux-x86_64.tar.gz")
sha256sums=('90552ff0addf22fc291fe1b54d6fa60a195587d8b66a48318d574a2d9ac94ad2')

package() {
    install -Dm755 bento "$pkgdir/usr/bin/bento"
    install -Dm755 bt "$pkgdir/usr/bin/bt"
}
