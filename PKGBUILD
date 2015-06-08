# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-lithuanian-dictionary
pkgver=20140224
pkgrel=2
pkgdesc='Lithuanian dictionary for WPS Office'
arch=('any')
url='http://wps-community.org/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(http://wps-community.org/download/dicts/lt_LT.zip)
sha1sums=('c215e3ed224c75cd20bb9176aa982abae99023b1')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts
  unzip -q $srcdir/lt_LT.zip -d $pkgdir/usr/lib/office6/dicts
}
