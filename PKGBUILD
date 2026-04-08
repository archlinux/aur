# Maintainer: JanJan74 <JanJan74@aur.archlinux.org>
pkgname=wiksr
pkgver=1.0
pkgrel=1
pkgdesc="Terminal instant answer browser using DuckDuckGo and Wikipedia"
arch=('any')
license=('MIT')
depends=('python' 'python-rich')
source=("wiksr.py")
sha256sums=('9d3eb08d6672116c4ee476baa37fa63fed3959f043047e2ab13cc17745432d32')

package() {
    install -Dm755 wiksr.py "$pkgdir/usr/local/bin/wiksr"
    install -Dm644 "$srcdir/../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
