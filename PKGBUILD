pkgname=aptos-bin
pkgver=7.8.1
pkgrel=1
pkgdesc="Command-line interface for interacting with the Aptos blockchain"
arch=('x86_64')
url="https://github.com/aptos-labs/aptos-core"
license=('Apache-2.0')
depends=()
makedepends=('debugedit' 'fakeroot')
source=("https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v${pkgver}/aptos-cli-${pkgver}-Linux-x86_64.zip")
sha256sums=('0aeb90d54bb5df0d458c609323463bc1d5db6dae5e83ae64f6fe86dc14e1fda4')

package() {
  cd "$srcdir"
  install -Dm755 aptos "$pkgdir/usr/local/bin/aptos"
}


