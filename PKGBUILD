# Maintainer: Omar Valdez <omarantoniovaldezf2@gmail.com>
#
# shellcheck disable=SC2034,SC2164,SC2154

pkgname=ts_query_ls-bin
pkgver=3.14.0
pkgrel=1
pkgdesc="LSP implementation for Tree-sitter's query files"
url='https://github.com/ribru17/ts_query_ls'
license=('MIT')
provides=('ts_query_ls')
replaces=('ts-query-ls-bin')
depends=('gcc-libs' 'glibc')
arch=('x86_64' 'aarch64')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/ribru17/ts_query_ls/releases/download/v$pkgver/ts_query_ls-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/ribru17/ts_query_ls/releases/download/v$pkgver/ts_query_ls-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('aa3f958d60dc84b3ebb86f779b5a42ab0fb11839cdd959da366b0a3f05020e76')
sha256sums_aarch64=('0046dc9f55a21ef467f725b885e617c4ce892516f13d40db65f7dda49fc9eb60')

package() {
    cd "$srcdir"
    install -Dm755 ts_query_ls "$pkgdir/usr/bin/ts_query_ls"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
