# Maintainer: zweiler1 <marc.zweiler@outlook.at>
pkgname=flintc-bin
pkgver=0.3.5
pkgrel=1
pkgdesc="Flint programming language compiler and language server"
arch=('x86_64')
url="https://github.com/flint-lang/flintc"
license=('MIT')

source=(
	"https://github.com/flint-lang/flintc/releases/download/v${pkgver}-core/flintc"
	"https://github.com/flint-lang/flintc/releases/download/v${pkgver}-core/fls"
)
sha256sums=(
	'9d6ac80c28a03caf9ce46a83601c1313b3b3adedc1e61997f30918470182a1b0'
	'75fcedf31ccacd26733ed5a5ae19b6ab410ce3aa256bcf79ed8678d8362897a4'
)

package() {
	install -Dm755 flintc "${pkgdir}/usr/bin/flintc"
	install -Dm755 fls "${pkgdir}/usr/bin/fls"
	install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
