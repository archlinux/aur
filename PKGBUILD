# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-greek-dictionary
pkgver=20131121
pkgrel=2
pkgdesc='Greek dictionary for WPS Office'
arch=('any')
url='http://wps-community.org/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(http://wps-community.org/download/dicts/el_GR.zip)
sha1sums=('9c2c55aef3f0dbc0db266a6d9d170f29a404902c')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts
  unzip -q $srcdir/el_GR.zip -d $pkgdir/usr/lib/office6/dicts
}
