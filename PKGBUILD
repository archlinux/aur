pkgname=aptos-bin
pkgver=7.11.0
pkgrel=1
pkgdesc="Command-line interface for interacting with the Aptos blockchain"
arch=('x86_64')
url="https://github.com/aptos-labs/aptos-core"
license=('Apache-2.0')
depends=()
makedepends=('debugedit' 'fakeroot')
source=("https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v${pkgver}/aptos-cli-${pkgver}-Linux-x86_64.zip")
sha256sums=('a7747813524f60d7a24490e47501cc1dc6456e1c743e3ea9f990e57366be55c9')

package() {
  cd "$srcdir"
  install -Dm755 aptos "$pkgdir/usr/local/bin/aptos"
}


