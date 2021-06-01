# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=skyimager
pkgname1=skyimager-gui
projectname=skycoin
pkgdesc="Skywire Node microSD / TFcard setup utility. skycoin.com"
pkgver=0.3.0
pkgrel=1
arch=('x86_64')
url="https://github.com/skycoin/skybian"
license=()
makedepends=()
depends=()
source=("${url}/releases/download/v${pkgver}/${pkgname}-linux-amd64-v${pkgver}.tar.gz")
sha256sums=('a62c8dac151a400ef357c4d2acdb287333e7d3b8890ffa86dfc3a093d04e5f9d')

package() {
  msg2 'installing files'
  install -Dm755 ${srcdir}/linux-amd64/${pkgname1} ${pkgdir}/usr/bin/${pkgname1}
  ln -rTsf ${pkgdir}/usr/bin/${pkgname1} ${pkgdir}/usr/bin/${pkgname}
}
