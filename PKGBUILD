# Maintainer: nyq <batasignal@proton.me>
pkgname=whitefire
pkgver=1.0.0
pkgrel=1
pkgdesc="Descriere scurtă a scriptului whitefire"
arch=('any')
url="https://github.com/user-tau/whitefire"
license=('MIT')
depends=('python')
source=('whitefire.py')
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/whitefire.py" "${pkgdir}/usr/bin/whitefire"
}
