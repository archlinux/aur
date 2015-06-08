# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-german-dictionary
pkgver=20131121
pkgrel=2
pkgdesc='German dictionary for WPS Office'
arch=('any')
url='http://wps-community.org/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(http://wps-community.org/download/dicts/de_DE.zip)
sha1sums=('ab32d59ce9c44451760d5a7846102089df0c8082')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts
  unzip -q $srcdir/de_DE.zip -d $pkgdir/usr/lib/office6/dicts
}
