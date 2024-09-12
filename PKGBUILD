# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=typos-lsp-bin
pkgver=0.1.23
pkgrel=1
pkgdesc='Source code spell checker for Visual Studio Code and LSP clients'
arch=('x86_64' 'aarch64')
url='https://github.com/tekumara/typos-lsp'
license=('MIT')
makedepends=()
depends=("gcc-libs" "glibc")

source_x86_64=("https://github.com/tekumara/typos-lsp/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/tekumara/typos-lsp/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('61ce07f1abd957554173dbe9989596ad2dc43f3f8ad31d86f399b665d49e9d75')
sha256sums_aarch64=('4a4ec4335de006f566fbbfd04a22d100ff619183fc19f54c45635d945e0be70b')

package() {
	install -Dm755 "${pkgname/-bin/}" "$pkgdir/usr/bin/${pkgname/-bin/}"
	install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
