# Maintainer: Kied Llaentenn <@kiedtl>
# Maintainer: ValleyKnight <valleyknight@protonmail.com>

pkgname=rsfetch-bin
pkgver=1.9.0
pkgrel=1
pkgdesc="Fast (1ms execution time) and somewhat(?) minimal fetch program written in Rust."
url="https://github.com/rsfetch/rsfetch"
license=('MIT')
conflicts=('rsfetch-git')
depends=()
makedepends=()
arch=("i686" "x86_64")
source=("https://github.com/rsfetch/rsfetch/releases/download/${pkgver}/rsfetch"
		"https://raw.githubusercontent.com/rsfetch/rsfetch/master/LICENSE")

package() {
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}

	install -Dm 755 ${srcdir}/rsfetch ${pkgdir}/usr/bin/rsfetch
	install -Dm 644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('6a637f3a0e6d6590531fda03e8b75850e71f8c7291e4ffedc0e19b4d1d769b87127f0a60c5fc5b1976cb1a72f64a4996f0726901741db18367ba0e26fc564e3c'
            'e0fce0b2157162045d6bc396f1215352613dfd1789fa470dbb56bf3d04daf6ccae53eb33fb012137f0620632b88551986ba16b9341f3a02bde65da58c643038f')
