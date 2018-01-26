# Maintainer: Jeremy Asuncion <jeremyasuncion808@gmail.com>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>

pkgname='lab'
pkgver='0.9.4'
pkgrel=1
pkgdesc="A hub-like tool for GitLab."
arch=('x86_64')
url="https://github.com/zaquestion/lab"
license=('custom:Unlicense')
depends=('git')
optdepends=('hub')
source=("https://github.com/zaquestion/lab/releases/download/v${pkgver}/lab_${pkgver}_linux_amd64.tar.gz")

package() {
  cd $srcdir
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 lab $pkgdir/usr/bin/lab
}

sha512sums=('7bc49f1218b7b6db9e89245e9443442fffaf94de3439243156277cb9f2e6286e5584eb1847271033d633d37d9dc32a3f2d38ffd2ccdbf004bcd58d3cfe4d5d0f')
