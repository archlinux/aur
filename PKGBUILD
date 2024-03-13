# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=typos-lsp-bin
pkgver=0.1.15
pkgrel=2
pkgdesc='Source code spell checker for Visual Studio Code and LSP clients'
arch=('x86_64' 'aarch64')
url='https://github.com/tekumara/typos-lsp'
license=('MIT')
makedepends=()
depends=("gcc-libs" "glibc")

source_x86_64=("https://github.com/tekumara/typos-lsp/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/tekumara/typos-lsp/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('1359306b2af1583100441d981eebb88a3c2e0fdd8a1817d7b7df100bce2e549d')
sha256sums_aarch64=('a45aa8fa6c31b420c1398f3ed88f0e547394a427e001236f7d6dfa9ed06c2605')

package() {
	install -Dm755 "${pkgname/-bin/}" "$pkgdir/usr/bin/${pkgname/-bin/}"
	install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
