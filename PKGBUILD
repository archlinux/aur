# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-ukrainian-dictionary
pkgver=20131121
pkgrel=4
pkgdesc='Ukrainian dictionary for WPS Office'
arch=('any')
url='https://github.com/wps-community/wps_community_website/tree/master/root/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(https://github.com/wps-community/wps_community_website/raw/master/root/download/dicts/uk_UA.zip)
sha512sums=('8e8fadb22250603ee71b7dd6cd013c163f67cec6ede044b382b56f92951c774c956360716c9174f748b2b234f57a2d4e78f8bed80147838302dc0b2b32adfa36')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts/spellcheck
  unzip -q $srcdir/uk_UA.zip -d $pkgdir/usr/lib/office6/dicts/spellcheck
}
