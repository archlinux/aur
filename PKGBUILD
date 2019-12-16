# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-portuguese-brazilian-dictionary
pkgver=20131121
pkgrel=4
pkgdesc='Portuguese (Brazilian) dictionary for WPS Office'
arch=('any')
url='https://github.com/wps-community/wps_community_website/tree/master/root/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(https://github.com/wps-community/wps_community_website/raw/master/root/download/dicts/pt_BR.zip)
sha512sums=('019510653442d6573160bba3a83167d6705f21cb60831259dcd3cfb9e1fb19d0c1ab9958c81ab83570920bdbeaf652ce788cb36989fd440208c24bfa5304521d')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts/spellcheck
  unzip -q $srcdir/pt_BR.zip -d $pkgdir/usr/lib/office6/dicts/spellcheck
}
