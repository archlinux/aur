# Maintainer: JanJan74 <JanJan74@aur.archlinux.org>
pkgname=wiksr
pkgver=1.0
pkgrel=3
pkgdesc="Terminal instant answer browser using local AI (ollama) and Wikipedia"
arch=('any')
license=('MIT')
depends=('python' 'python-rich')
optdepends=('ollama: local AI answers instead of Wikipedia fallback')
source=("wiksr.py")
sha256sums=('9ae8aa8f2450b7ea8e20a71ab3c0abbb63293f96f3915542c754ac6acea4972c')

package() {
    install -Dm755 wiksr.py "$pkgdir/usr/local/bin/wiksr"
    install -Dm644 "$srcdir/../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
