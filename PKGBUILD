# Contributor: Mike Yuan <me@yhndnzj.com>
# Maintainer: Asuka Minato <i at asukaminato at eu dot org>
# Co-Maintainer: Jason Barrow <barrow at jasonbarrow dot com>
# Contributor: Aron Young <aronyang505 at gmail dot com>

pkgname=ast-grep-bin
pkgver=0.39.6
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
sha256sums_x86_64=('56cc29b2072dc0557a73e372984038033d2a8d078056dbdbe17df3d8c60b9b5e')
sha256sums_aarch64=('418200e9879608f27086bc9ad4b9c9de6ebb7e5e678d5f140cbd491f6f288fe8')
b2sums=('84489d87909510ed8ec39fb743c9e0983ba6a4bce03dd299cc41404d5f9050d1b08c3e28dbca3c81a1e958c5aa08aaeb8638b25a92e30ae14df8936e6c949d9c')
b2sums_x86_64=('73624762930183aac5c9399dcb4135487902cc1c253b57bbf369b71db7cb98cf31a17c873fddc0e4511a716797576276a2a164ce5ac2f8c6f8d93a9a05d45caf')
b2sums_aarch64=('cabf8e08b826b16e4331e6eb6bdb6fb343108aa86f3ca0652ed7dc7ea50db33a191e0bd69c945d4085b898abb2c34795a254187bc014dff84142004f0afc8944')

package() {
  find $srcdir -name "ast-grep" -type f -print -exec install -vDm755 {} "$pkgdir/usr/bin/ast-grep" \;
  install -vDm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname
}
