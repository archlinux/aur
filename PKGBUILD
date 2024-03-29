# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=typos-lsp-bin
pkgver=0.1.16
pkgrel=1
pkgdesc='Source code spell checker for Visual Studio Code and LSP clients'
arch=('x86_64' 'aarch64')
url='https://github.com/tekumara/typos-lsp'
license=('MIT')
makedepends=()
depends=("gcc-libs" "glibc")

source_x86_64=("https://github.com/tekumara/typos-lsp/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/tekumara/typos-lsp/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('9a7cd691b7746a49ad3602bbcef8bd672802d10f6d0da7e159b235c6a4f321d1')
sha256sums_aarch64=('d867792d56b626e4e437d5e4f668dc29d426a1e7af8468d13381a523bce0c568')

package() {
	install -Dm755 "${pkgname/-bin/}" "$pkgdir/usr/bin/${pkgname/-bin/}"
	install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
