# Maintainer: JanJan74 <JanJan74@aur.archlinux.org>
pkgname=wiksr
pkgver=1.0
pkgrel=4
pkgdesc="Terminal instant answer browser using local AI (ollama) and Wikipedia"
arch=('any')
license=('MIT')
depends=('python' 'python-rich')
optdepends=('ollama: local AI answers instead of Wikipedia fallback')
source=("wiksr.py")
sha256sums=('f3d40639cc7d71425db7b8415ca8cba392f5b7379615cbaf30dc564d21ee1570')

package() {
    install -Dm755 wiksr.py "$pkgdir/usr/local/bin/wiksr"
    install -Dm644 "$srcdir/../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
