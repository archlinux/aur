# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Steve Skydev <steve@skycoin.net>
pkgname=skycoin-font
pkgver=1
pkgrel=1
pkgdesc="Skycoin sans font"
url="https://skycoin.net"
arch=(any)
makedepends=('unzip')
source=("https://downloads.skycoin.net/branding/Skycoin-Sans.zip")
sha256sums=('5f2a34270c4302d8c6a8b17676208d51698eb136fbff20080b1c7cfe552c908c')
validpgpkeys=('DE08F924EEE93832DABC642CA8DC761B1C0C0CFC')

package() {
  cd $srcdir
  install -d "$pkgdir/usr/share/$pkgname"
  install -m644 *.otf "$pkgdir/usr/share/$pkgname"
}
