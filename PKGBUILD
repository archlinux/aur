pkgname=aptos-bin
pkgver=7.10.2
pkgrel=1
pkgdesc="Command-line interface for interacting with the Aptos blockchain"
arch=('x86_64')
url="https://github.com/aptos-labs/aptos-core"
license=('Apache-2.0')
depends=()
makedepends=('debugedit' 'fakeroot')
source=("https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v${pkgver}/aptos-cli-${pkgver}-Linux-x86_64.zip")
sha256sums=('88a57f25b4fd6b1cf2e057bf37d38265ba405da4a8d1a79ba544edee63be5ad3')

package() {
  cd "$srcdir"
  install -Dm755 aptos "$pkgdir/usr/local/bin/aptos"
}


