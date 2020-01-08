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
            'e0fce0b2157162045d6bc396f1215352613dfd1789fa470dbb56bf3d04daf6ccae53eb33fb012137f0620632b88551986ba16b9341f3a02bde65da58c643038f')
