# Maintainer: A. Husen <hi@husen.id>
pkgname=nonicons-font
pkgver=r57.4467f88
pkgrel=1
pkgdesc="A set of SVG icons representing programming languages, designing & development tools."
arch=('any')
url="https://github.com/yamatsum/nonicons"
license=('unknown')
source=("nonicons-${pkgver}.ttf::${url}/raw/master/dist/nonicons.ttf")
sha512sums=('d9b777ec82fd724511c964d799abe82c43df21531f0c6cd8c20c6d7e5290da6a20d2a323a3bc692801be26bf32f43892426d18649273d0aec2fb986dcbd49572')

package() {
    install -Dm644 "${srcdir}/nonicons-"*.ttf "${pkgdir}/usr/share/fonts/TTF/nonicons.ttf"
}

