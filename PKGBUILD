# Maintainer: Omar Valdez <omarantoniovaldezf2@gmail.com>
#
# shellcheck disable=SC2034,SC2164,SC2154

pkgname=ts-query-ls-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="Language server for tree-sitter's query files"
url='https://github.com/ribru17/ts_query_ls'
license=('MIT')
provides=('ts_query_ls')
depends=('gcc-libs' 'glibc')
arch=('x86_64' 'aarch64')
source_x86_64=("https://github.com/ribru17/ts_query_ls/releases/download/v${pkgver}/ts_query_ls-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/ribru17/ts_query_ls/releases/download/v${pkgver}/ts_query_ls-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('41aa56bd0406f09e4798fa3d0fab467545d8eeedc4b34e1aaeb62eca91534840')
sha256sums_aarch64=('84a57be701c6165031317e0972751354b1170d4f6bd312e563b36f9461f64d5c')

package() {
    cd "$srcdir"
    install -Dm755 ts_query_ls "${pkgdir}/usr/bin/ts_query_ls"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
