# Maintainer: Omar Valdez <omarantoniovaldezf2@gmail.com>
#
# shellcheck disable=SC2034,SC2164,SC2154

pkgname=ts_query_ls-bin
pkgver=3.16.0
pkgrel=2
pkgdesc="LSP implementation for Tree-sitter's query files"
url='https://github.com/ribru17/ts_query_ls'
license=('MIT')
provides=('ts_query_ls')
replaces=('ts-query-ls-bin')
depends=('libgcc' 'glibc')
arch=('x86_64' 'aarch64')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/ts_query_ls-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/ts_query_ls-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('35859176141c3ebaac231000fd96d50a14c6bc26963f0a1662aac33f656d443d')
sha256sums_aarch64=('3512a7cb56e0b2ce934d135d83949f0ec4a9f15ca3497e6b3295673d4bd6e14c')

package() {
    cd "$srcdir"
    install -Dm755 ts_query_ls "$pkgdir/usr/bin/ts_query_ls"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
