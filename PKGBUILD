# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-turkish-dictionary
pkgver=20131224
pkgrel=3
pkgdesc='Turkish dictionary for WPS Office'
arch=('any')
url='http://wps-community.org/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(http://wps-community.org/download/dicts/tr_TR.zip)
sha512sums=('58f37a9dbc836497092f8adca0ad0f7771eeb2749e59f264544397bb9a77d10998df4f786bfd648b1d7922a3c4ce8b4b112574170b0fba90b3751d6891928142')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts/spellcheck
  unzip -q $srcdir/tr_TR.zip -d $pkgdir/usr/lib/office6/dicts/spellcheck
}
