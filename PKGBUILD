# Maintainer: A. Husen <hi@husen.id>
pkgname=nonicons-font
pkgver=r51.6e4984b
pkgrel=1
pkgdesc="A set of SVG icons representing programming languages, designing & development tools."
arch=('any')
url="https://github.com/yamatsum/nonicons"
license=('unknown')
source=("nonicons-${pkgver}.ttf::${url}/raw/master/dist/nonicons.ttf")
sha512sums=('9684ab3db414f734bb422ac6daa5a2a9d23019ca9230a441652e17ce79136032282b5069afd123161021d3424523216d4b530b5e973abd427230a9c02a8e2b40')

package() {
    install -Dm644 "${srcdir}/nonicons-"*.ttf "${pkgdir}/usr/share/fonts/TTF/nonicons.ttf"
}

