# Maintainer: Robert Brzozowski <robson75@linux.pl>

pkgname=gant-icon-theme
pkgver=1.2
pkgrel=1
pkgdesc="Created Icons by mattahan"
arch=('any')
url="https://www.deviantart.com/mattahan/art/G-A-N-T-3035321"
license=('cc-by-nc-sa')

source=("$pkgname-$pkgver.tar.gz::https://github.com/robson-66/GANT/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0fd31a7cc8170f17661bd7b180cbc27d544f2f4ac8d73d61cd76644435649d14')

package() {
  mkdir -p "$pkgdir"/usr/share/icons/
  cp -R "$srcdir"/GANT*/ "$pkgdir"/usr/share/icons/Gant/

  find $pkgdir/usr -type f -exec chmod 644 {} \;
  find $pkgdir/usr -type d -exec chmod 755 {} \;
  find $pkgdir/usr -type f -name '.directory' -delete
}