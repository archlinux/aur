# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-german-dictionary
pkgver=20131121
pkgrel=4
pkgdesc='German dictionary for WPS Office'
arch=('any')
url='https://github.com/wps-community/wps_community_website/tree/master/root/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(https://github.com/wps-community/wps_community_website/raw/master/root/download/dicts/de_DE.zip)
sha512sums=('388378d34f15397923d71b0210034eeb6674f839593aa46606737aeee01a12957d5a26dabcf0ca1ba41ae3658c4e1b6d6b3137d779fbd05c9a6a4f54b16af646')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts/spellcheck
  unzip -q $srcdir/de_DE.zip -d $pkgdir/usr/lib/office6/dicts/spellcheck
}
