# Maintainer: Jeremy Asuncion <jeremyasuncion808@gmail.com>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>

pkgname=lab
pkgver=0.11.1
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

sha512sums=('b19e721102f574f9670e1f88a292689f77fbe180c9d7cc17f28503e3ac78940988ce5c8a07fda6fe50610302b3c0392fc6b0636a527e9d78d0fbc19bbe0f2d5e')
