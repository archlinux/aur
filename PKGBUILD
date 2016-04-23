# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-polish-dictionary
pkgver=20160202
pkgrel=1
pkgdesc='Polish dictionary for WPS Office'
arch=('any')
url='http://wps-community.org/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(http://wps-community.org/download/dicts/pl_PL.zip)
sha1sums=('a0c25cf977d7e02daabb1256b3d3ffd438c05842')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts
  unzip -q $srcdir/pl_PL.zip -d $pkgdir/usr/lib/office6/dicts
}
