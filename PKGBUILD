# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-spanish-dictionary
pkgver=20140307
pkgrel=2
pkgdesc='Spanish dictionary for WPS Office'
arch=('any')
url='http://wps-community.org/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(http://wps-community.org/download/dicts/es_ES.zip)
sha1sums=('880c20620784885baa3e10367e4632d22de13743')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts
  unzip -q $srcdir/es_ES.zip -d $pkgdir/usr/lib/office6/dicts
}
