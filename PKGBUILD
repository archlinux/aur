# Maintainer: Christoph Drexler <chrdr at gmx dot at>
# Contributor: hdh <hieu.d.hoang@gmail.com>

pkgname=otf-irianis
_fontname=Irianis-Std
pkgver=1.006
pkgrel=2
pkgdesc="A serif font"
arch=('any')
conflicts=('otf-adf')
url="http://arkandis.tuxfamily.org/adffonts.html"
license=('GPL-2.0-or-later WITH Font-exception-2.0')
groups=('otf-adf-fonts')
source=("http://arkandis.tuxfamily.org/fonts/${_fontname}-20100729.zip")

sha256sums=('5a252bf7fbfca67aa421798f2fbe48c2f5d46208330633499553b308ef6d3bf2')

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
