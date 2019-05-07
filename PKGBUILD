# Maintainer: Kied Llaentenn <@kiedtl>
# Maintainer: ValleyKnight <valleyknight@protonmail.com>

pkgname=rsfetch-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Fast (0.01s - 0.2s execution time) and somewhat(?) minimal fetch program written in Rust."
url="https://github.com/phate6660/rsfetch"
license=('Unlicense')
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

sha512sums=('5ef12a47982e07c3a9b07e286fafc55d8f74d66b32cfcafe93cd5d1dd43ff3fe3a970376f5714e951db0d32c87d2a16edd932531e1fa79cdc19bc4fe9f83dcad'
            '6db610810f1b22a21ef217b4b6ace78dd5a4f427be3e6934a5770b64d019c0699459ea433b7117e955aac3feea02bd703fba2892a7961e27b2c0de859f68d7d7')
