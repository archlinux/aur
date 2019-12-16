# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-khmer-dictionary
pkgver=20140325
pkgrel=4
pkgdesc='Khmer dictionary for WPS Office'
arch=('any')
url='https://github.com/wps-community/wps_community_website/tree/master/root/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(https://github.com/wps-community/wps_community_website/raw/master/root/download/dicts/km_KH.zip)
sha512sums=('419073184385ef54c587ddbf64eaa1b971b20a29a1470003baf41297160ef9b3ab2c3f4cbbc49410f34d5e0192d2a224f7ae82fce634ae7328c71b741f14fa14')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts/spellcheck
  unzip -q $srcdir/km_KH.zip -d $pkgdir/usr/lib/office6/dicts/spellcheck
}
