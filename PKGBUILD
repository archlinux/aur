# Maintainer: Sam Burgos < jsbm1089 at gmail dot com >

pkgname=mint-y-icons
pkgver=1.0.2
pkgrel=3
pkgdesc="New icons from LinuxMint 18 inspired by the Moka icon set. Stable releases"
arch=('any')
url='http://packages.linuxmint.com'
license=('GPL3')
depends=()
makedepends=()
optdepends=("mint-x-icons: Mint-Y inherits missing icons from Mint-X")
conflicts=("mint-y-icons-git")
source=("${url}/pool/main/m/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('b0d38df3a0724791e59964c220c4946e4a9715c91c01154c50406138dca971f3')

pkgver() {
  cd "${srcdir}/${pkgname}"
}

package() {
  cd ${srcdir}/${pkgname}
  cp -aR ./usr ${pkgdir}
}


