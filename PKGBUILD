
# Maintainer: Sondre Nilsen <nilsen.sondre@gmail.com>
pkgname=ttf-devicons
pkgver=1.8.0
pkgrel=1
pkgdesc="An iconic font for developers"
arch=("any")
url="https://github.com/vorillaz/devicons"
license=("MIT")
depends=("fontconfig")
source=("$pkgname-$pkgver.tar.gz::https://github.com/vorillaz/devicons/archive/${pkgver}.tar.gz"
	"MIT")
sha256sums=("d8d2dc243ca42897a082ffe32a22cab53cdd148cf87b24162cf450ccfc12fece"
            "fd2b2a28ff7d4fbe6073edaf43ce6387430f10193a28fa09f893398463b8000b")

package_ttf-devicons() {
    install -d "${pkgdir}/usr/share/fonts/TTF"
    install -m644 "${srcdir}/devicons-${pkgver}"/fonts/*.ttf "${pkgdir}/usr/share/fonts/TTF/"
    install -D -m644 MIT "${pkgdir}/usr/share/licenses/${pkgname}/MIT"
}
