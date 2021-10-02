# Maintainer: A. Husen <hi@husen.id>
pkgname=nonicons-font
pkgver=r47.0135a2f
pkgrel=1
pkgdesc="A set of SVG icons representing programming languages, designing & development tools."
arch=('any')
url="https://github.com/yamatsum/nonicons"
license=('unknown')
source=("nonicons-${pkgver}.ttf::${url}/raw/master/dist/nonicons.ttf")
sha512sums=('58d933ea14775fcc5ee8e142e287cc2054a33d05e719e10a7edf00f01388948e302dfd055d955f63d4a871af376858f403b666cac540c7cb4874907582b8763c')

package() {
    install -Dm644 "${srcdir}/nonicons-"*.ttf "${pkgdir}/usr/share/fonts/TTF/nonicons.ttf"
}

