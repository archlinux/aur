# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-ukrainian-dictionary
pkgver=20131121
pkgrel=2
pkgdesc='Ukrainian dictionary for WPS Office'
arch=('any')
url='http://wps-community.org/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(http://wps-community.org/download/dicts/uk_UA.zip)
sha1sums=('f816233f69c420a37cf9651a2e618734ecffa2f5')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts
  unzip -q $srcdir/uk_UA.zip -d $pkgdir/usr/lib/office6/dicts
}
