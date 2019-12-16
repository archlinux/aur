# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-greek-dictionary
pkgver=20131121
pkgrel=4
pkgdesc='Greek dictionary for WPS Office'
arch=('any')
url='https://github.com/wps-community/wps_community_website/tree/master/root/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(https://github.com/wps-community/wps_community_website/raw/master/root/download/dicts/el_GR.zip)
sha512sums=('5accb2626164a2c11046b166a4aaf47cb02565159946037597c26dac46208549647fb4b3d96c3beb225412b78a113e8587d56c1a070e2137a11c1b6e2fb104d9')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts/spellcheck
  unzip -q $srcdir/el_GR.zip -d $pkgdir/usr/lib/office6/dicts/spellcheck
}
