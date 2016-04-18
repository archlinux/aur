# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: <qqqqqqqqq9 at web dot de>
# Contributor: yannsen <ynnsen at gmail dot com>
pkgname=jnc
pkgver=0.20
pkgrel=1
pkgdesc="A wrapper for the Juniper network connect client (ncsvc) and the Pulse Secure client (pulsesvc)"
arch=('i686' 'x86_64')
url="http://www.scc.kit.edu/scc/net/juniper-vpn/linux/"
license=('GPL')
depends=('perl' 'openssl' 'net-tools')
depends_x86_64=('lib32-nss-mdns' 'lib32-zlib')
optdepends=('java-runtime: for Network Connect Java GUI, with x86_64 the Network Connect Java GUI will not work')
source=($pkgname-$pkgver::http://www.scc.kit.edu/scc/net/juniper-vpn/linux/$pkgname)
install=jnc.install
sha256sums=('67854a7f7125dcce0e60bcd209738f23c718a27c551b7105a8d5ba717449aecc')

package() {
  install -Dm755 $pkgname-$pkgver "$pkgdir/usr/bin/$pkgname"
}
