# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-turkish-dictionary
pkgver=20131224
pkgrel=2
pkgdesc='Turkish dictionary for WPS Office'
arch=('any')
url='http://wps-community.org/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(http://wps-community.org/download/dicts/tr_TR.zip)
sha1sums=('467908aefffc4dea537d2a97aac6e105502c1abe')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts
  unzip -q $srcdir/tr_TR.zip -d $pkgdir/usr/lib/office6/dicts
}
