# Maintainer: icanttipe <matthieu@envoidunet.com>
pkgname=freedcamp-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI tool for Freedcamp project management API"
arch=('any')
url="https://github.com/icanttipe/freedcamp-cli"
license=('MIT')
depends=('python')
optdepends=('bash-completion: tab completion')
source=("$pkgname-$pkgver.tar.gz::https://github.com/icanttipe/freedcamp-cli/archive/v$pkgver.tar.gz")
sha256sums=('16ece8596e46f4fb03b3466a31d640db6a63e73cda02be3235796ff97c4ef7b5')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 freedcamp "$pkgdir/usr/bin/freedcamp"
  install -Dm644 freedcamp-completion.bash "$pkgdir/usr/share/bash-completion/completions/freedcamp"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
