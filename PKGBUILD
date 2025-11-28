# Maintainer: Christoph Drexler <chrdr at gmx dot at>
# Contributor: hdh <hieu.d.hoang@gmail.com>

pkgname=otf-solothurn
_fontname=Solothurn-Std
pkgver=1.004
pkgrel=2
_date=20111228
pkgdesc="A modern sans-serif font"
arch=('any')
conflicts=('otf-adf')
url="http://arkandis.tuxfamily.org/adffonts.html"
license=('GPL-2.0-or-later WITH Font-exception-2.0')
groups=('otf-adf-fonts')
source=("http://arkandis.tuxfamily.org/fonts/${_fontname}-${_date}.zip")

sha256sums=('10bd7c07d78b9f37f4ef43f703541b9383fe0acfd636a763e9c20c0c559bbb4f')

build() {
    # nothing to do
    true
}

package() {
    install -d "${pkgdir}/usr/share/fonts/OTF"
    install -Dm644 "${srcdir}/${_fontname}-${_date}/OTF/"*.otf\
                   "${pkgdir}/usr/share/fonts/OTF"
    install -Dm644 "${srcdir}/${_fontname}-${_date}/NOTICE.txt"\
                   "${pkgdir}/usr/share/licenses/${pkgname}/Font-exception-2.0.txt"
}
