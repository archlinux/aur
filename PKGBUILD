# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-russian-dictionary
pkgver=20131121
pkgrel=2
pkgdesc='Russian dictionary for WPS Office'
arch=('any')
url='http://wps-community.org/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(http://wps-community.org/download/dicts/ru_RU.zip)
sha1sums=('f9ee7f90a296a920f4edaf746bca14de605327ae')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts
  unzip -q $srcdir/ru_RU.zip -d $pkgdir/usr/lib/office6/dicts
}
