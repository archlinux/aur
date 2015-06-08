# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-swedish-dictionary
pkgver=20131121
pkgrel=2
pkgdesc='Swedish dictionary for WPS Office'
arch=('any')
url='http://wps-community.org/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(http://wps-community.org/download/dicts/sv_SE.zip)
sha1sums=('828655a2418709d5415dfae9f91fca95e28f90be')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts
  unzip -q $srcdir/sv_SE.zip -d $pkgdir/usr/lib/office6/dicts
}
