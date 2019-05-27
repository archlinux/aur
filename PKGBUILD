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

sha512sums=('aa6074f38362c7a2802b96a6fd83c2632673dc232da4ccef37c5aa98a6ce2ba994c6cf6df6e4d15fe788bc431fddb193e4fbb02613d26dd5a0e8c350c3962f7f'
            '6db610810f1b22a21ef217b4b6ace78dd5a4f427be3e6934a5770b64d019c0699459ea433b7117e955aac3feea02bd703fba2892a7961e27b2c0de859f68d7d7')
