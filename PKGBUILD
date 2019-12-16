# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-polish-dictionary
pkgver=20160202
pkgrel=6
pkgdesc='Polish dictionary for WPS Office'
arch=('any')
url='https://github.com/wps-community/wps_community_website/tree/master/root/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(https://github.com/wps-community/wps_community_website/raw/master/root/download/dicts/pl_PL.zip)
sha512sums=('0644ced38e363060d86cdf4e64699442ccb5420c70baa8e14474aa3875d2e11f02372234151152f0a58be66ead25964ce47b1e1314e874c643815ec8b956a7b5')
 
 package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts/spellcheck/pl_PL
  unzip -q $srcdir/pl_PL.zip -d $pkgdir/usr/lib/office6/dicts/spellcheck/pl_PL
}
