# Maintainer: zweiler1 <marc.zweiler@outlook.at>
pkgname=flintc-bin
pkgver=0.4.2
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
	'56525e00c1375b5fb9a07859419cc95027f8e978517353f7f184bbe6383ebe5e'
	'47aea784e802a2e1f389f80b2c3d882cbf4cfc86d7195e95e4f5f99b4aff6771'
)

package() {
	install -Dm755 flintc "${pkgdir}/usr/bin/flintc"
	install -Dm755 fls "${pkgdir}/usr/bin/fls"
}
