# Maintainer: A. Husen <hello@husen.id>
pkgname=nonicons-font
pkgver=r36.e43d3e8
pkgrel=1
pkgdesc="A set of SVG icons representing programming languages, designing & development tools."
arch=('any')
url="https://github.com/yamatsum/nonicons"
license=('unknown')
source=("${url}/raw/master/dist/nonicons.ttf")
sha512sums=("1eef9c72138535cae0f198de065c0ee747252c63fef00d0bf8c3c413d461801880a725480a2d27a1e621f956ba69357900eb7a19c34a4c183d79bf24cdf6f7ac")

package() {
    install -dm755 "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/"*.ttf "${pkgdir}/usr/share/fonts/TTF"
}

