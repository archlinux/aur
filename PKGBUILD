# Maintainer: Christoph Drexler <chrdr at gmx dot at>
# Contributor: hdh <hieu.d.hoang@gmail.com>

pkgname=ttf-romande
_fontname=Romande-Collection
pkgver=1.010
pkgrel=2
_date=20110730
pkgdesc="A serif font"
arch=('any')
conflicts=('ttf-adf')
url="http://arkandis.tuxfamily.org/adffonts.html"
license=('GPL-2.0-or-later WITH Font-exception-2.0')
groups=('ttf-adf-fonts')
source=("http://arkandis.tuxfamily.org/fonts/${_fontname}-${_date}.zip")

sha256sums=('724a625e30f4317af5dc7b3e99a5de8128c23e025f83bd48977fa4dcb03ad35c')

build() {
    # nothing to do
    true
}

package() {
    install -d "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/${_fontname}/Romande-Std/TTF/"*.ttf\
                   "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/${_fontname}/RomandeNo2-Std/TTF/"*.ttf\
                   "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/${_fontname}/NOTICE.txt"\
                   "${pkgdir}/usr/share/licenses/${pkgname}/Font-exception-2.0.txt"
}
