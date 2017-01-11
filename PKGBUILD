# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='ttf-monda'
pkgver='1.0'
pkgrel='2'
description='Geometric sans serif font by Vernon Adams.'
arch=('any')
license=('custom:OFL')
_dl_base_url='https://github.com/vernnobile/mondaFont/raw/master/version1.00'
source=("${_dl_base_url}/Monda-Bold.ttf"
        "${_dl_base_url}/Monda-Regular.ttf"
        "${_dl_base_url}/OFL.txt")
sha512sums=('427769e6d69f7386ce8bde0f39a49887059f996232db9f60cd3bc547fdec3798b9ee9b12124d2fc93cdd241d16996c6a64807974208c710792157d0dc9a26cce'
            '4a6b3fb92c1856c6a705ac1065cd64b921a4c678ba96bbe745a45a640489b3e3442132e6a4836b9c5c6bc118b74a3df018dd41954ec00f81c43f8f7702672f74'
            'a5a9ab2e314cdfccf283c8b247293dec95ad7b13c9e746b158cd597a46699d3dd4152fec09f044850419b0d7dacf6e6b90a3c8362662b505cc1d48c6e6ee05fa')

package () {
        install -m755 -d "${pkgdir}/usr/share/fonts/${pkgname}"
        install -m644 -t "${pkgdir}/usr/share/fonts/${pkgname}" "${srcdir}"/*.ttf
        install -Dm644 "${srcdir}/OFL.txt" \
                "${pkgdir}/usr/share/licenses/${pkgname}/OFL"
}
