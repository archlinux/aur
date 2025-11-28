# Maintainer: Christoph Drexler <chrdr at gmx dot at>
# Contributor: hdh <hieu.d.hoang@gmail.com>

pkgname=otf-aurelis
_fontname=AurelisNo2-Std
pkgver=1.008
pkgrel=2
_date=20110311
pkgdesc="A serif font"
arch=('any')
conflicts=('otf-adf')
url="http://arkandis.tuxfamily.org/adffonts.html"
license=('GPL-2.0-or-later WITH Font-exception-2.0')
groups=('otf-adf-fonts')
source=("http://arkandis.tuxfamily.org/fonts/${_fontname}-${_date}.zip")

sha256sums=('2fc8476894e7a443960f90d0e50b2f26f4b211b95de53f07874ca6cf7b5eb1ec')

build() {
    # nothing to do
    true
}

package() {
    install -d "${pkgdir}/usr/share/fonts/OTF"
    install -Dm644 "${srcdir}/${_fontname}/OTF/"*.otf\
                   "${pkgdir}/usr/share/fonts/OTF"
    install -Dm644 "${srcdir}/${_fontname}/NOTICE.txt"\
                   "${pkgdir}/usr/share/licenses/${pkgname}/Font-exception-2.0.txt"
}
