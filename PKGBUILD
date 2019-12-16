# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-spanish-dictionary
pkgver=20140307
pkgrel=4
pkgdesc='Spanish dictionary for WPS Office'
arch=('any')
url='https://github.com/wps-community/wps_community_website/tree/master/root/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(https://github.com/wps-community/wps_community_website/raw/master/root/download/dicts/es_ES.zip)
sha512sums=('0c9cae3f4bae8c61eb6c6c060f12271d20f383b453387c1e3c829bb79fd309b83ac3d655a10ad57f88d8637f18903361bdb4b04660a563ee84b56b6f4f1cef01')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts/spellcheck
  unzip -q $srcdir/es_ES.zip -d $pkgdir/usr/lib/office6/dicts/spellcheck
}
