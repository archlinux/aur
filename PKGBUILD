# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-romanian-dictionary
pkgver=20140108
pkgrel=2
pkgdesc='Romanian dictionary for WPS Office'
arch=('any')
url='http://wps-community.org/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(http://wps-community.org/download/dicts/ro_RO.zip)
sha1sums=('b7d1365c4d22daf997d5ce46e2a253690e6ea26b')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts
  unzip -q $srcdir/ro_RO.zip -d $pkgdir/usr/lib/office6/dicts
}
