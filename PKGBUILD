# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-slovak-dictionary
pkgver=20141010
pkgrel=2
pkgdesc='Slovak dictionary for WPS Office'
arch=('any')
url='http://wps-community.org/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(http://wps-community.org/download/dicts/sk_SK.zip)
sha1sums=('97613d961b76730a157ed611b3c0d3e76e518c89')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts
  unzip -q $srcdir/sk_SK.zip -d $pkgdir/usr/lib/office6/dicts
}
