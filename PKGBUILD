# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-dutch-dictionary
pkgver=20131121
pkgrel=2
pkgdesc='Dutch dictionary for WPS Office'
arch=('any')
url='http://wps-community.org/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(http://wps-community.org/download/dicts/nl_NL.zip)
sha1sums=('0cc26c86545aa7a0bff9f34fafec6e795f022383')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts
  unzip -q $srcdir/nl_NL.zip -d $pkgdir/usr/lib/office6/dicts
}
