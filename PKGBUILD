# Maintainer: Your Name <youremail@domain.com>
pkgname=phpgrep-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Syntax-aware grep for PHP code."
arch=(x86_64 aarch64)
url="https://github.com/quasilyte/phpgrep"
license=('MIT')
provides=(phpgrep)
source_x86_64=("https://github.com/quasilyte/phpgrep/releases/download/v${pkgver}/phpgrep-${pkgver}-linux-amd64.zip")
source_aarch64=("https://github.com/quasilyte/phpgrep/releases/download/v${pkgver}/phpgrep-${pkgver}-linux-arm64.zip")
sha256sums_x86_64=('4b40e758e9cef0c4ed2e31eaa1b5834c9f415808a68114f993efbbe53dcfb9e3')
sha256sums_aarch64=('d02c6a3b775bff2248cbb0b06623bf7afb5f7a268c936239b6bc2079721a10eb')

package() {
	install -Dm755 phpgrep -t "$pkgdir"/usr/bin/
}
