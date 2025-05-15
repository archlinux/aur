# Maintainer: Omar Valdez <omarantoniovaldezf2@gmail.com>
#
# shellcheck disable=SC2034,SC2164,SC2154

pkgname=ts-query-ls-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="Language server for tree-sitter's query files"
url='https://github.com/ribru17/ts_query_ls'
license=('MIT')
provides=('ts_query_ls')
depends=('gcc-libs' 'glibc')
arch=('x86_64' 'aarch64')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/ribru17/ts_query_ls/releases/download/v$pkgver/ts_query_ls-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/ribru17/ts_query_ls/releases/download/v$pkgver/ts_query_ls-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('bd4db7fe57c8efecf8f37769e5ca53bdce1ab0e3af06fc492c578b784cc724b5')
sha256sums_aarch64=('b04e844d0d92753c35d718592e0218dd995c20772edf15bc5a53fd54e1a02d51')

package() {
    cd "$srcdir"
    install -Dm755 ts_query_ls "$pkgdir/usr/bin/ts_query_ls"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
