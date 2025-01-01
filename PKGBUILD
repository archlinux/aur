# Maintainer: Omar Valdez <omarantoniovaldezf2@gmail.com>
#
# shellcheck disable=SC2034,SC2164,SC2154

pkgname=ts-query-ls-bin
pkgver=1.4.2
pkgrel=1
pkgdesc="Language server for tree-sitter's query files"
url='https://github.com/ribru17/ts_query_ls'
license=('MIT')
provides=('ts_query_ls')
depends=('gcc-libs' 'glibc')
arch=('x86_64' 'aarch64')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/ribru17/ts_query_ls/releases/download/v$pkgver/ts_query_ls-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/ribru17/ts_query_ls/releases/download/v$pkgver/ts_query_ls-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('ec578cb4ab650314d486e4111bcfb5bf781c33d6398d0da890fdfe1bf6e9d21f')
sha256sums_aarch64=('414ef8a31765a60444a0b8e7c38d9364c0053b4ab5cee02c6f8cf86085bace7f')

package() {
    cd "$srcdir"
    install -Dm755 ts_query_ls "$pkgdir/usr/bin/ts_query_ls"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
