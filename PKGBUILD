# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-portuguese-dictionary
pkgver=20140218
pkgrel=4
pkgdesc='Portuguese dictionary for WPS Office'
arch=('any')
url='https://github.com/wps-community/wps_community_website/tree/master/root/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(https://github.com/wps-community/wps_community_website/raw/master/root/download/dicts/pt_PT.zip)
sha512sums=('28a888955f2794a66622c2dfa30ec73703f2881d17e4339da0632625659859956a0a2a3a3d324b0a1850d72b01321a6be33a2bffb2b1c8d456b6294b1512e5bc')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts/spellcheck
  unzip -q $srcdir/pt_PT.zip -d $pkgdir/usr/lib/office6/dicts/spellcheck
}
