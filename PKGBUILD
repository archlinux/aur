# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-portuguese-dictionary
pkgver=20140218
pkgrel=2
pkgdesc='Portuguese dictionary for WPS Office'
arch=('any')
url='http://wps-community.org/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(http://wps-community.org/download/dicts/pt_PT.zip)
sha1sums=('57d2a25257154d104d8938183bce2b67c68495c5')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts
  unzip -q $srcdir/pt_PT.zip -d $pkgdir/usr/lib/office6/dicts
}
