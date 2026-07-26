pkgname=hamburger
pkgver=1.0
pkgrel=1
pkgdesc="A hamburger PNG. Installed because why not."
arch=('any')
license=('WTFPL')
source=("hamburger.png")
sha256sums=('SKIP')

package() {
    install -Dm644 "$srcdir/hamburger.png" \
        "$pkgdir/usr/share/hamburger/hamburger.png"
}
