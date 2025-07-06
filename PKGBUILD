# Maintainer: Omar Valdez <omarantoniovaldezf2@gmail.com>
#
# shellcheck disable=SC2034,SC2164,SC2154

pkgname=ts-query-ls-bin
pkgver=3.4.1
pkgrel=1
pkgdesc="Language server for tree-sitter's query files"
url='https://github.com/ribru17/ts_query_ls'
license=('MIT')
provides=('ts_query_ls')
depends=('gcc-libs' 'glibc')
arch=('x86_64' 'aarch64')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/ribru17/ts_query_ls/releases/download/v$pkgver/ts_query_ls-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/ribru17/ts_query_ls/releases/download/v$pkgver/ts_query_ls-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('f754a64a8fb86236110cf9be81857bf26b85723a22b1fde9d8bfab1254466c04')
sha256sums_aarch64=('52e8355acaa43597729bc9dd4099b99b5c222909229e979333b2ce3bc59b1c20')

package() {
    cd "$srcdir"
    install -Dm755 ts_query_ls "$pkgdir/usr/bin/ts_query_ls"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
