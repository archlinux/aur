# Maintainer: Gaweł Kazimierczuk <kazi@kazigk.pl>
pkgname=otf-fontawesome
pkgver=4.7.0
pkgrel=1
arch=(any)
source=("http://fontawesome.io/assets/font-awesome-${pkgver}.zip")
md5sums=("SKIP")
package() {
	install -Dm664 "${srcdir}/font-awesome-${pkgver}/fonts/FontAwesome.otf" "${pkgdir}/usr/share/fonts/OTF/FontAwesome.otf"
}
