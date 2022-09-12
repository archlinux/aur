# Maintainer: Robert Brzozowski <robson75@linux.pl>

pkgname=darkcold
pkgver=5.0
pkgrel=0
pkgdesc="GTK+ dark theme"
arch=('any')
url="https://github.com/originalseed/darkcold"
license=('GPL')
depends=('gtk2' 'gtk3')

source=("https://github.com/robson-66/DarkCold/archive/refs/tags/v5.0.tar.gz")
sha256sums=('c24f3e6e4c450d5692fb46529278360650ceb70231c74ed876c2cbff39470a67')

package() {
 mkdir -p "$pkgdir"/usr/share/themes/
  cp -R "$srcdir"/DarkCold*/ "$pkgdir"/usr/share/themes/DarkCold/
  
  find $pkgdir/usr -type f -exec chmod 644 {} \;
  find $pkgdir/usr -type d -exec chmod 755 {} \;
  find $pkgdir/usr -type f -name '.directory' -delete
}
