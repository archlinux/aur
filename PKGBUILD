# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-swedish-dictionary
pkgver=20131121
pkgrel=4
pkgdesc='Swedish dictionary for WPS Office'
arch=('any')
url='https://github.com/wps-community/wps_community_website/tree/master/root/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(https://github.com/wps-community/wps_community_website/raw/master/root/download/dicts/sv_SE.zip)
sha512sums=('773f6b58b30ebdef3c30e14bff0cbe9fe578795746720322cfc496df57af2ab8ccf90e6bd1a9b5f3b817678bf7c4fa6e39e1e1421af5aae771b540ab846c51dc')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts/spellcheck
  unzip -q $srcdir/sv_SE.zip -d $pkgdir/usr/lib/office6/dicts/spellcheck
}
