# Maintainer: Christoph Drexler <chrdr at gmx dot at>
# Contributor: hdh <hieu.d.hoang@gmail.com>

pkgname=ttf-ornements
_fontname=OrnementsADF
pkgver=1.001
pkgrel=2
pkgdesc="A font of ornamental elements"
arch=('any')
conflicts=('ttf-adf')
url="http://arkandis.tuxfamily.org/adffonts.html"
license=('GPL-2.0-or-later WITH Font-exception-2.0')
groups=('ttf-adf-fonts')
source=("http://arkandis.tuxfamily.org/fonts/${_fontname}.zip")

sha256sums=('97a4a5f71db57e80fa5edb73c27d736c9b5c4de972b5bc072bba5854d27fa571')

build() {
    # nothing to do
    true
}

package() {
    install -d "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/${_fontname}/TTF/${_fontname}.ttf"\
                   "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/${_fontname}/NOTICE"\
                   "${pkgdir}/usr/share/licenses/${pkgname}/Font-exception-2.0.txt"
}
