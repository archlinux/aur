# Contributor: Mike Yuan <me@yhndnzj.com>
# Maintainer: Asuka Minato <i at asukaminato at eu dot org>
# Co-Maintainer: Jason Barrow <barrow at jasonbarrow dot com>
# Contributor: Aron Young <aronyang505 at gmail dot com>

pkgname=ast-grep-bin
pkgver=0.45.3
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
sha256sums_x86_64=('f8ac830881339d1edee6b2652f54798c0f4da5a827f2db38a08ee31117783ce8')
sha256sums_aarch64=('b39cfbc58da4b869a88b8a4bc57bd5deb0d24541e704cf7c257da7b53ec81c8f')
b2sums=('84489d87909510ed8ec39fb743c9e0983ba6a4bce03dd299cc41404d5f9050d1b08c3e28dbca3c81a1e958c5aa08aaeb8638b25a92e30ae14df8936e6c949d9c')
b2sums_x86_64=('ee52770ab0cc256e7176d9c5e487717f252cc0f18b72325b616be98b1a6a20c5731b6ad28689f75d91055ae3799f0adda3e2ae7eea05c4c6fb16c1d72087783e')
b2sums_aarch64=('423db5aa944b9ccbd86fbfd6d925a4765fbdd5f71e37baf1693775976eca34211e9b0270532e3b691fb7730a389029f06a1619a07ee2be59d979aad91d8dc38e')

package() {
  find "$srcdir" -name "ast-grep" -type f -print -exec install -vDm755 {} "$pkgdir/usr/bin/ast-grep" \;
  install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
