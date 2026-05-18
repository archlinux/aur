# PKGBUILD
pkgname=kvantum-theme-arasaka
pkgver=1.0.0
pkgrel=1
pkgdesc="Arasaka terminal Kvantum theme — black, red, cyan"
arch=('any')
url="https://github.com/thanvirdiouf/Kvantum-Theme-Arasaka"
license=('CC0 1.0 Universal')
depends=('kvantum')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  install -dm755 "$pkgdir/usr/share/Kvantum/Arasaka"
  install -m644 "$srcdir/kvantum-theme-arasaka-$pkgver/Arasaka/Arasaka.kvconfig" \
    "$pkgdir/usr/share/Kvantum/Arasaka/"
  install -m644 "$srcdir/kvantum-theme-arasaka-$pkgver/Arasaka/Arasaka.svg" \
    "$pkgdir/usr/share/Kvantum/Arasaka/"
  install -m644 "$srcdir/kvantum-theme-arasaka-$pkgver/Arasaka/Arasaka.png" \
    "$pkgdir/usr/share/Kvantum/Arasaka/"
}
