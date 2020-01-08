# Maintainer: Kied Llaentenn <@kiedtl>
# Maintainer: ValleyKnight <valleyknight@protonmail.com>

pkgname=rsfetch-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Fast (~5ms execution time) and somewhat(?) minimal fetch program written in Rust."
url="https://github.com/rsfetch/rsfetch"
license=('MIT')
conflicts=('rsfetch-git')
depends=()
makedepends=()
arch=("x86_64")
source=("https://github.com/rsfetch/rsfetch/releases/download/${pkgver}/rsfetch"
		"https://raw.githubusercontent.com/rsfetch/rsfetch/master/LICENSE")

package() {
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}

	install -Dm 755 ${srcdir}/rsfetch ${pkgdir}/usr/bin/rsfetch
	install -Dm 644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('51709d13a026fd92e161093b7130e457cc1ddec8828cfb01e09f3e6333746443cc72c611d606b775520d2becfa06a388bbffa8559d9d5cfc8ba42197b075b615'
            '6068361d083532ae55ff865583cb0d27c49f26275429358119a5b41edadbd04cdfcc6aa3aa5cf7b39059308d007b4b343d07c2520106d0055608efcc837f630c')
