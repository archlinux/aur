# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-lithuanian-dictionary
pkgver=20140224
pkgrel=4
pkgdesc='Lithuanian dictionary for WPS Office'
arch=('any')
url='https://github.com/wps-community/wps_community_website/tree/master/root/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(https://github.com/wps-community/wps_community_website/raw/master/root/download/dicts/lt_LT.zip)
sha512sums=('a9e2fe0440f53d3ac89bff1339cc45f8d433947edeeaf5b3530544b0bed90f4f7ec0d3da42c98346ae1772051c527b914cd2eb238373fa0100054cff9b77c539')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts/spellcheck
  unzip -q $srcdir/lt_LT.zip -d $pkgdir/usr/lib/office6/dicts/spellcheck
}
