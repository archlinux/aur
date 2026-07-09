# Maintainer: zweiler1 <marc.zweiler@outlook.at>
pkgname=flintc-bin
pkgver=0.4.0
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
	'0223dbff99d2ab08741a60391caee160e1c5ad35ccc0c1d056f3102a05f6e6d8'
	'af23ecc996aebaa0bed9dd2dbcf27d13f3f8feaf9cd6ef2b5d02654888276023'
)

package() {
	install -Dm755 flintc "${pkgdir}/usr/bin/flintc"
	install -Dm755 fls "${pkgdir}/usr/bin/fls"
	install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
