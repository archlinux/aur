# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-czech-dictionary
pkgver=20140617
pkgrel=4
pkgdesc='Czech dictionary for WPS Office'
arch=('any')
url='https://github.com/wps-community/wps_community_website/tree/master/root/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(https://github.com/wps-community/wps_community_website/raw/master/root/download/dicts/cs_CZ.zip)
sha512sums=('dfbc7c4971363665382002076a5924c852617a6075c80cbeb627b6d209103415088c5d7ae73d41279f1f84778a7345500e21810e98e30a35aaca01dcfee988f6')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts/spellcheck
  unzip -q $srcdir/cs_CZ.zip -d $pkgdir/usr/lib/office6/dicts/spellcheck
}
