pkgname=aptos-bin
pkgver=9.3.0
pkgrel=1
pkgdesc="Command-line interface for interacting with the Aptos blockchain"
arch=('x86_64')
url="https://github.com/aptos-labs/aptos-core"
license=('Apache-2.0')
depends=()
makedepends=('debugedit' 'fakeroot')
source=("https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v${pkgver}/aptos-cli-${pkgver}-Linux-x86_64.zip")
sha256sums=('cbf1d55360cd7f85fc2e80532b5a10d73d75e6dba01386d6dc1b51e98635abf8')

package() {
  cd "$srcdir"
  install -Dm755 aptos "$pkgdir/usr/local/bin/aptos"
}


