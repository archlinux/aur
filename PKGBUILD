# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-russian-dictionary
pkgver=20131121
pkgrel=3
pkgdesc='Russian dictionary for WPS Office'
arch=('any')
url='http://wps-community.org/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(http://wps-community.org/download/dicts/ru_RU.zip)
sha512sums=('04139068de23f29835b5ed604e5459ae3356e657d2193d4625ce4a121c99a0c792b34c1df071039a710141cbe38c3a6c1ed9a0f4e17c4dbd72fa003be6167bee')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts/spellcheck
  unzip -q $srcdir/ru_RU.zip -d $pkgdir/usr/lib/office6/dicts/spellcheck
}
