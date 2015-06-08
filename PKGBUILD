# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-italian-dictionary
pkgver=20131121
pkgrel=2
pkgdesc='Italian dictionary for WPS Office'
arch=('any')
url='http://wps-community.org/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(http://wps-community.org/download/dicts/it_IT.zip)
sha1sums=('aaa7e9d09d432837ba17eae0f680753d2c290085')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts
  unzip -q $srcdir/it_IT.zip -d $pkgdir/usr/lib/office6/dicts
}
