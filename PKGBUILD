# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='ttf-wireone'
pkgver='1.012'
pkgrel='1'
description='Condensed monoline sans serif font.'
arch=('any')
license=('custom:OFL')
url='https://github.com/cyrealtype/Wire-One'
_dl_base_url="${url}/raw/master"
source=("${_dl_base_url}/WireOne.ttf"
        "${_dl_base_url}/OFL.txt")
sha512sums=('84fae083ce740e3fbdc4f4214e93a89e73fe7abf6c50e1c81e55768393ba2b0320b08cb55cf4eee331aae2f37d027dca7bb903611d23f05149f92dd808b6939b'
            '5a8d29a2c6673568a95bedfa0738906c4b1bac528a2903fc07fbd881b330376081569e2ee36adb54b0db11a075bad8570f6098bebe9aa4cf9330ae43d29b6fea')

package () {
        install -m755 -d "${pkgdir}/usr/share/fonts/${pkgname}"
        install -m644 -t "${pkgdir}/usr/share/fonts/${pkgname}" "${srcdir}"/*.ttf
        install -Dm644 "${srcdir}/OFL.txt" \
                "${pkgdir}/usr/share/licenses/${pkgname}/OFL"
}
