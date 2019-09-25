# Maintainer: Colin Woodbury <colin@kadena.io>

pkgname=chainweb-miner
pkgver=0.2.0
pkgrel=1
pkgdesc="Miner for the Kadena Public Blockchain (Chainweb)."
arch=('x86_64')
url='https://kadena.io/'
license=('BSD 3-Clause')
depends=('gmp' 'rocksdb-release')
source=(https://github.com/kadena-io/chainweb-node/releases/download/testnet-v3/chainweb-miner-testnet-v3-archlinux.zip)
md5sums=('ca75292dc5e2d64fe6d1443d785cb9aa')

package() {
  install -Dm 755 ${srcdir}/chainweb-miner ${pkgdir}/usr/bin/chainweb-miner
}
