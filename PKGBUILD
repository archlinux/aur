# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-portuguese-brazilian-dictionary
pkgver=20131121
pkgrel=2
pkgdesc='Portuguese (Brazilian) dictionary for WPS Office'
arch=('any')
url='http://wps-community.org/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(http://wps-community.org/download/dicts/pt_BR.zip)
sha1sums=('af185af9dbb576216ae5de69101ed3a2ae70e7da')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts
  unzip -q $srcdir/pt_BR.zip -d $pkgdir/usr/lib/office6/dicts
}
