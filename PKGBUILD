# Maintainer: Robert Brzozowski <robson75@linux.pl>

pkgname=darkcold
pkgver=5.0
pkgrel=1
pkgdesc="GTK+ dark theme"
arch=('any')
url="https://github.com/originalseed/darkcold"
license=('GPL')
depends=('gtk2' 'gtk3')

source=("https://github.com/robson-66/DarkCold/archive/refs/heads/master.zip")
sha256sums=('SKIP')

package() {
 mkdir -p "$pkgdir"/usr/share/themes/
  cp -R "$srcdir"/DarkCold*/ "$pkgdir"/usr/share/themes/DarkCold/
  
  find $pkgdir/usr -type f -exec chmod 644 {} \;
  find $pkgdir/usr -type d -exec chmod 755 {} \;
  find $pkgdir/usr -type f -name '.directory' -delete
}
