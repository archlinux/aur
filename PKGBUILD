# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=skycoin-font
pkgver=0.0.1
pkgrel=1
pkgdesc="Skycoin sans font. Skycoin.com"
url="https://skycoin.com"
arch=('any')
makedepends=('unzip')
source=("https://downloads.skycoin.com/branding/Skycoin-Sans.zip")
sha256sums=('5f2a34270c4302d8c6a8b17676208d51698eb136fbff20080b1c7cfe552c908c')

package() {
  cd ${srcdir}
  install -d "${pkgdir}/usr/share/fonts/$pkgname"
  install -m644 *.otf "${pkgdir}/usr/share/fonts/$pkgname"
}
