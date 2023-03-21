# Maintainer: Robert Brzozowski <robson75@linux.pl>

pkgname=umicons
pkgver=1.0
pkgrel=1
pkgdesc="Created Icons by mattahan"
arch=('any')
url="https://www.deviantart.com/mattahan/art/Umicons-Volume-3-2211092"
license=('cc-by-nc-sa')

source=("https://github.com/robson-66/Umicons/archive/refs/heads/master.zip")
sha256sums=('SKIP')

package() {
 mkdir -p "$pkgdir"/usr/share/icons/
  cp -R "$srcdir"/Umicons*/ "$pkgdir"/usr/share/icons/Umicons/
  
  find $pkgdir/usr -type f -exec chmod 644 {} \;
  find $pkgdir/usr -type d -exec chmod 755 {} \;
  find $pkgdir/usr -type f -name '.directory' -delete
}
