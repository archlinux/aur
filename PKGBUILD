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

sha512sums=('SKIP'
            'SKIP')
