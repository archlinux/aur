# Contributor: Mike Yuan <me@yhndnzj.com>
# Maintainer: Asuka Minato <i at asukaminato at eu dot org>
# Co-Maintainer: Jason Barrow <barrow at jasonbarrow dot com>
# Contributor: Aron Young <aronyang505 at gmail dot com>

pkgname=ast-grep-bin
pkgver=0.39.9
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
sha256sums_x86_64=('ef0f01cd410bf4dafaa2877d592bc5ee0c0978f9a0854a4633ed6082a48963c6')
sha256sums_aarch64=('b96041c59bf5686cc15bb74b4931db0d51c831c645574e7f1305d311b68c70f3')
b2sums=('84489d87909510ed8ec39fb743c9e0983ba6a4bce03dd299cc41404d5f9050d1b08c3e28dbca3c81a1e958c5aa08aaeb8638b25a92e30ae14df8936e6c949d9c')
b2sums_x86_64=('f046cfafc55ff738a5e98244d5135fc7541e27e18a142ef2042297f8b575e0ff200cfd90a85109e1b01f45823dac62192c75586cc5f792ee80a5f92ba2df1c75')
b2sums_aarch64=('2b9f9956b7b8aee04daab1cb9d85adf4e46639966faedb096d26f0ac2af56a329927e961e5baaeae3010e52c198e13c286afc34ac2eb919f87e99316ea1b9b96')

package() {
  find $srcdir -name "ast-grep" -type f -print -exec install -vDm755 {} "$pkgdir/usr/bin/ast-grep" \;
  install -vDm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname
}
