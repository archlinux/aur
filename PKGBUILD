# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=typos-lsp-bin
pkgver=0.1.35
pkgrel=1
pkgdesc='Source code spell checker for Visual Studio Code and LSP clients'
arch=('x86_64' 'aarch64')
url='https://github.com/tekumara/typos-lsp'
license=('MIT')
makedepends=()
depends=("gcc-libs" "glibc")

source_x86_64=("https://github.com/tekumara/typos-lsp/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/tekumara/typos-lsp/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('335472ce434b45eeb5a372c6e9ce00fedffe2f3a949ece2e2fa431ae37599328')
sha256sums_aarch64=('75d2f69ca15071ff8d85d23c1539337efd5559cb3501cefef228a5e4680ac719')

package() {
	install -Dm755 "${pkgname/-bin/}" "$pkgdir/usr/bin/${pkgname/-bin/}"
	install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
