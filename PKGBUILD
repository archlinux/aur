# Maintainer: Robert Brzozowski <robson75@linux.pl>

pkgname=gant-icon-theme
pkgver=1.0
pkgrel=0
pkgdesc="Created Icons by mattahan"
arch=('any')
url="https://www.deviantart.com/mattahan/art/G-A-N-T-3035321"
license=('cc-by-nc-sa')

source=("$pkgname-$pkgver.tar.gz::https://github.com/robson-66/Gant/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('39663e20e9a642ebdf65f575f33da3e526a61c5c2ac9ea1a991449cea32b2a9a')

package() {
  mkdir -p "$pkgdir"/usr/share/icons/
  cp -R "$srcdir"/Gant*/ "$pkgdir"/usr/share/icons/Gant/

  find $pkgdir/usr -type f -exec chmod 644 {} \;
  find $pkgdir/usr -type d -exec chmod 755 {} \;
  find $pkgdir/usr -type f -name '.directory' -delete
}