# Maintainer: JanJan74 <JanJan74@aur.archlinux.org>
pkgname=wiksr
pkgver=1.0
pkgrel=2
pkgdesc="Terminal instant answer browser using local AI (ollama) and Wikipedia"
arch=('any')
license=('MIT')
depends=('python' 'python-rich')
optdepends=('ollama: local AI answers instead of Wikipedia fallback')
source=("wiksr.py")
sha256sums=('5cc943d4e6c122a568bd89f737dc202d512cf9f7d073a3c5a32f120778b04773')

package() {
    install -Dm755 wiksr.py "$pkgdir/usr/local/bin/wiksr"
    install -Dm644 "$srcdir/../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
