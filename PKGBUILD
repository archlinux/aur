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
sha256sums=('a6e76c4467e876bffe9c8513d7fa297640f9e37924ed6dbc956cce35a0d108ee')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 freedcamp "$pkgdir/usr/bin/freedcamp"
  install -Dm644 freedcamp-completion.bash "$pkgdir/usr/share/bash-completion/completions/freedcamp"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
