# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-french-dictionary
pkgver=20131121
pkgrel=4
pkgdesc='French dictionary for WPS Office'
arch=('any')
url='https://github.com/wps-community/wps_community_website/tree/master/root/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(https://github.com/wps-community/wps_community_website/raw/master/root/download/dicts/fr_FR.zip)
sha512sums=('be724ca4409ca1af89c3239e6ef1330a8b6877b42f9ca0bb1d02235677a9227b459a3d4207f8eaf2117b992e933f8e308c6437e3a69e780732843cb05b89feaa')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts/spellcheck
  unzip -q $srcdir/fr_FR.zip -d $pkgdir/usr/lib/office6/dicts/spellcheck
}
