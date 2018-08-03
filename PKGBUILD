# Maintainer: Daniel Martí <mvdan@mvdan.cc>

pkgname=shfmt-bin
_pkg=sh
_name=shfmt
pkgver=2.5.1
pkgrel=1
pkgdesc="Format shell programs (pre-compiled static binary)"
url="https://github.com/mvdan/${_pkg}"
license=('BSD')
provides=('shfmt')
conflicts=('shfmt')

arch=('x86_64')
source_x86_64=(
	"https://github.com/mvdan/sh/releases/download/v${pkgver}/shfmt_v${pkgver}_linux_amd64"
	"https://raw.githubusercontent.com/mvdan/sh/v${pkgver}/LICENSE"
)
sha256sums_x86_64=(
	'37fd1f66d7bf9c48130bbc50a3747750c6e3b202c404ca4a5941f81b9efd9b97'
	'SKIP'
)

package() {
	install -Dm755 shfmt_v${pkgver}_linux_amd64 "${pkgdir}/usr/bin/${_name}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
