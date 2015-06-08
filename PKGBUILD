# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-czech-dictionary
pkgver=20140617
pkgrel=2
pkgdesc='Czech dictionary for WPS Office'
arch=('any')
url='http://wps-community.org/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(http://wps-community.org/download/dicts/cs_CZ.zip)
sha1sums=('e1679916ec803e711c8b11d06e60d5f3918ea7cb')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts
  unzip -q $srcdir/cs_CZ.zip -d $pkgdir/usr/lib/office6/dicts
}
