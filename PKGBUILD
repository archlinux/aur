# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-dutch-dictionary
pkgver=20131121
pkgrel=4
pkgdesc='Dutch dictionary for WPS Office'
arch=('any')
url='https://github.com/wps-community/wps_community_website/tree/master/root/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(https://github.com/wps-community/wps_community_website/raw/master/root/download/dicts/nl_NL.zip)
sha512sums=('66f3fc9dea357e3bd05435442edaf3cbfdd244d0385b37fdc6f27312b8db257fde98913db9f48dcb03aec4d2f41c4b8106723f01740c94c7ab7a267fe2d209c7')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts/spellcheck
  unzip -q $srcdir/nl_NL.zip -d $pkgdir/usr/lib/office6/dicts/spellcheck
}
