# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-spanish-catalan-dictionary
pkgver=20150407
pkgrel=3
pkgdesc='Spanish (Catalan) dictionary for WPS Office'
arch=('any')
url='https://github.com/wps-community/wps_community_website/tree/master/root/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(https://github.com/wps-community/wps_community_website/raw/master/root/download/dicts/ca_ES.zip)
sha512sums=('6fa5f7283e13aa2c4308859faf97be222d822866fc0ea4c872246450447019f212e66abc309081cad7a3a77a74c13a736298a30c4c12964ed296fd077433f959')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts/spellcheck
  unzip -q $srcdir/ca_ES.zip -d $pkgdir/usr/lib/office6/dicts/spellcheck
}
