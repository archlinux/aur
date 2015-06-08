# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-french-dictionary
pkgver=20131121
pkgrel=2
pkgdesc='French dictionary for WPS Office'
arch=('any')
url='http://wps-community.org/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(http://wps-community.org/download/dicts/fr_FR.zip)
sha1sums=('2ad526cd456d474e44eac3941f85b2329120ce20')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts
  unzip -q $srcdir/fr_FR.zip -d $pkgdir/usr/lib/office6/dicts
}
