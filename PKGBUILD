# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=typos-lsp-bin
pkgver=0.1.19
pkgrel=1
pkgdesc='Source code spell checker for Visual Studio Code and LSP clients'
arch=('x86_64' 'aarch64')
url='https://github.com/tekumara/typos-lsp'
license=('MIT')
makedepends=()
depends=("gcc-libs" "glibc")

source_x86_64=("https://github.com/tekumara/typos-lsp/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/tekumara/typos-lsp/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('f0c593f338bfc311cbcc42cb0f1f8dbc9142b491b7fb937f24a4c1d88fc36f58')
sha256sums_aarch64=('7ddb77c90c213f8843c7d16f536387dd9dfe09cd151db37002898536ee29f29f')

package() {
	install -Dm755 "${pkgname/-bin/}" "$pkgdir/usr/bin/${pkgname/-bin/}"
	install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
