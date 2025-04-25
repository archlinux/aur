pkgname=aptos-bin
pkgver=7.3.0
pkgrel=1
pkgdesc="Command-line interface for interacting with the Aptos blockchain"
arch=('x86_64')
url="https://github.com/aptos-labs/aptos-core"
license=('Apache-2.0')
depends=('debugedit' 'fakeroot')
source=("https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v${pkgver}/aptos-cli-${pkgver}-Linux-x86_64.zip")
sha256sums=('3ae1d637d9d784f1138a76c9769197b0c452fea3cd64b2972c8db2e4b99c0136')

package() {
  cd "$srcdir"
  install -Dm755 aptos "$pkgdir/usr/local/bin/aptos"
}


