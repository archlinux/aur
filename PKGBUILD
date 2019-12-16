# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-slovak-dictionary
pkgver=20141010
pkgrel=5
pkgdesc='Slovak dictionary for WPS Office'
arch=('any')
url='https://github.com/wps-community/wps_community_website/tree/master/root/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(https://github.com/wps-community/wps_community_website/raw/master/root/download/dicts/sk_SK.zip)
sha512sums=('47ec204a931af3866b9c029b106aee6b26a289f465d001c938339f50198b00c96d3a5549f0e4e99f401073c1959fe2d4158d6e62e0ddc12d40617f3305292504')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts/spellcheck/sk_SK
  unzip -q $srcdir/sk_SK.zip -d $pkgdir/usr/lib/office6/dicts/spellcheck/sk_SK
}
