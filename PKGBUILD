# Maintainer: Afri 5chdn <aur@cach.co>
# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=geth
pkgver=1.3.3
pkgrel=1
pkgdesc="The go-ethereum commandline client (geth cli)."
arch=('x86_64')
depends=('gmp' 'leveldb' 'readline')
optdepends=('mist: Graphical Ethereum wallet and DApps browser.')
url="https://github.com/ethereum/go-ethereum"
license=('GPL')
source=("${pkgname}-${pkgver}.tar.bz2::https://github.com/ethereum/go-ethereum/releases/download/v1.3.3/geth-Linux64-20160105143200-1.3.3-c541b38.tar.bz2")
sha256sums=('a2c1e5a11db673f329a38316b8a964e6a40944a6ce51cd65900edbbbafbf259a')

package() {
  install -d "${pkgdir}/usr/bin"
  install -m 755 "$srcdir/geth" "$pkgdir/usr/bin/geth"
}
