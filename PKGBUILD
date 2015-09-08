# Maintainer: <qqqqqqqqq9 at web dot de>
# Contributor: yannsen <ynnsen at gmail dot com>
pkgname=jnc
pkgver=0.19
pkgrel=1
pkgdesc="A wrapper for the Juniper network connect client (ncsvc)"
arch=('any')
url="http://www.scc.kit.edu/scc/net/juniper-vpn/linux/"
license=('GPL')
depends=('perl' 'openssl' 'net-tools')
[[ $CARCH == "x86_64" ]] && depends=('perl' 'openssl' 'net-tools'  'lib32-nss-mdns' 'lib32-zlib')
makedepends=()
optdepends=('java: for Network Connect Java GUI, with x86_64 the Network Connect Java GUI will not work')
source=(http://www.scc.kit.edu/scc/net/juniper-vpn/linux/$pkgname)
install=jnc.install
sha256sums=('5eb2f187a32c009ca4e19042ee46e6a1b99a0ec0714b0b93f207b11440ff4fb7')

package() {
  install -d $pkgdir/usr/bin/
  install -m755 jnc $pkgdir/usr/bin/
}

