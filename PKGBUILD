# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-khmer-dictionary
pkgver=20140325
pkgrel=2
pkgdesc='Khmer dictionary for WPS Office'
arch=('any')
url='http://wps-community.org/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(http://wps-community.org/download/dicts/km_KH.zip)
sha1sums=('bd6280d7635699271890a5163e7008ba62155774')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts
  unzip -q $srcdir/km_KH.zip -d $pkgdir/usr/lib/office6/dicts
}
