# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=skyimager
_pkgname=skyimager-gui
_projectname=skycoin
pkgdesc="Skywire Node microSD / TFcard setup utility. skycoin.com"
pkgver=0.4.0
pkgrel=1
arch=('x86_64')
url="https://github.com/skycoin/skybian"
license=()
makedepends=()
depends=()
source=("${url}/releases/download/v${pkgver}/${pkgname}-linux-amd64-v${pkgver}.tar.gz")
sha256sums=('9fea28c31508edffba69912c5e91950a078c83b58e0a18e45a56fc84eddb0446')

package() {
  msg2 'installing files'
#  install -Dm755 ${srcdir}/linux-amd64/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
  install -Dm755 ${srcdir}/linux-amd64/skybian ${pkgdir}/usr/bin/${_pkgname}
  ln -rTsf ${pkgdir}/usr/bin/${_pkgname} ${pkgdir}/usr/bin/${pkgname}
}
