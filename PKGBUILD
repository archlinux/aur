# Contributor: Mike Yuan <me@yhndnzj.com>
# Maintainer: Asuka Minato <i at asukaminato at eu dot org>
# Co-Maintainer: Jason Barrow <barrow at jasonbarrow dot com>
# Contributor: Aron Young <aronyang505 at gmail dot com>

pkgname=ast-grep-bin
pkgver=0.40.5
pkgrel=1
pkgdesc="A fast and easy tool for code searching, linting, rewriting at large scale"
arch=('x86_64' aarch64)
url="https://github.com/ast-grep/ast-grep"
license=('MIT')
source=(https://raw.githubusercontent.com/ast-grep/ast-grep/c9aff6ace291c5a02e48446aa9be1d471b763ca2/LICENSE)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/ast-grep/ast-grep/releases/download/$pkgver/app-x86_64-unknown-linux-gnu.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/ast-grep/ast-grep/releases/download/$pkgver/app-aarch64-unknown-linux-gnu.zip")
provides=(ast-grep)
depends=(gcc-libs glibc)
conflicts=(ast-grep)
sha256sums=('81471889c77b2161a3e4dcdb1b2e6ca382e485766132d92d5fe1d7497e7dd2d9')
sha256sums_x86_64=('9715cb5933a4d7fe9e4d8c2be870a9a82840c3f2ec4a57bdff7f15d0912cc676')
sha256sums_aarch64=('9596c2abfdf450203e5653e185d805133d5499f8c2cbb00b1aab54754ca70e13')
b2sums=('84489d87909510ed8ec39fb743c9e0983ba6a4bce03dd299cc41404d5f9050d1b08c3e28dbca3c81a1e958c5aa08aaeb8638b25a92e30ae14df8936e6c949d9c')
b2sums_x86_64=('5cf27278c1bd0c3471fef981be0592c407da6280892d938f10cbcec8c3fc4611a8de93077a20756963eae44fa9a103f7ccd714b349db84f15831604328024be1')
b2sums_aarch64=('d5a606cf653fe0c03ae0606087b4b5341e6888d938986ea7c3fcd58fc8b937d3e639c690d344c3675e96a53b40b0cae356825d6fedd0ae13ebe9ba7455584f28')

package() {
  find $srcdir -name "ast-grep" -type f -print -exec install -vDm755 {} "$pkgdir/usr/bin/ast-grep" \;
  install -vDm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname
}
