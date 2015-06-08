# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-spanish-catalan-dictionary
pkgver=20150407
pkgrel=1
pkgdesc='Spanish (Catalan) dictionary for WPS Office'
arch=('any')
url='http://wps-community.org/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(http://wps-community.org/download/dicts/ca_ES.zip)
sha1sums=('974af03ac6f7995f4a5a82e24e4ac6ee0b9d15fe')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts
  unzip -q $srcdir/ca_ES.zip -d $pkgdir/usr/lib/office6/dicts
}
