# Maintainer: Kied Llaentenn <@kiedtl>
# Maintainer: ValleyKnight <valleyknight@protonmail.com>

pkgname=rsfetch-bin
pkgver=1.6.6
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

sha512sums=('6fa1174237d0522622d0eec336d806a2410db09b682739d96f5c5968ca624d6cdd817d7be10797fa905044ff35ba5a5aaa412370a6b41ac91c5f699ec674cca4'
            '6db610810f1b22a21ef217b4b6ace78dd5a4f427be3e6934a5770b64d019c0699459ea433b7117e955aac3feea02bd703fba2892a7961e27b2c0de859f68d7d7')
