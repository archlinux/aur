# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-rosario-variable
pkgver=1.201
pkgrel=2
pkgdesc='Sans-serif typeface family from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/rosario/'
license=('OFL')
_commit='d8bf83600979c82357d8023243d3d01a386fc7fe'
source=("${pkgname}-${pkgver}-${pkgrel}-LICENSE.md::https://raw.githubusercontent.com/Omnibus-Type/Rosario/${_commit}/LICENSE.md"
        "https://raw.githubusercontent.com/Omnibus-Type/Rosario/${_commit}/fonts/variable/Rosario-Italic[wght].ttf"
        "https://raw.githubusercontent.com/Omnibus-Type/Rosario/${_commit}/fonts/variable/Rosario[wght].ttf")

sha256sums=('03a0ecffec02fa4ee8286b929df620c7a8803a8bea8021c9edb5bcdedd043549'
            '42a418a5472e60671432d8981f8deffd4090706a941a33a87e077c703e9304c5'
            'ebeaaae45c8840f5054dc4bfca2101bed3d744b40368597cd6877980f21bfe48')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
