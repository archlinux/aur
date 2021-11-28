# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=ttf-wireone
pkgver=1.101
pkgrel=1
description='Condensed monoline sans serif font.'
arch=(any)
license=(custom:OFL)
url=https://github.com/cyrealtype/Wire-One
_dl_base_url="${url}/raw/1b12a460c2012de003b774d5d65907fa4107ffa5"
source=("${_dl_base_url}/fonts/TTF/WireOne-Regular.ttf"
        "${_dl_base_url}/OFL.txt")
b2sums=('0bac5fa031ff535fb50544fb5cc80f81299bb85283af05490f172e0caa6d35a2ce104ccc2916e292bfe7107070e96345ddc9196caad508a56c5d096bf3bcb2c8'
        '2f2021a3c67034ec95dbe165dc90e6a7d19493ff812dceefa5f3ff148350215b92ae2cae276561043b092494551bfa578b6eb4ca6059cb1f27bb031a2b5142c3')

package () {
        install -m755 -d "${pkgdir}/usr/share/fonts/${pkgname}"
        install -m644 -t "${pkgdir}/usr/share/fonts/${pkgname}" "${srcdir}"/*.ttf
        install -Dm644 "${srcdir}/OFL.txt" \
                "${pkgdir}/usr/share/licenses/${pkgname}/OFL"
}
