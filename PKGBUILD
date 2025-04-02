# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Ns2Kracy <2220496937@qq.com>
# Contributor: CorrectRoadH <correctroadh@gmail.com>
pkgname=casaos-ui
pkgver=0.4.20
pkgrel=1
pkgdesc='The front-end of CasaOS,build with VueJS.'
arch=('any')
url='https://github.com/IceWhaleTech/CasaOS-UI'
license=('unknown')
groups=('casaos')

source=(
    ${url}/releases/download/v${pkgver}/linux-all-casaos-v${pkgver}.tar.gz
)

sha256sums=('066b4a24add3bcf4eb65a9f9950e712e9234fb4ee762ee83801c9debbabb40c7')
package() {
    _sysdir="${srcdir}/build/sysroot"
    mkdir -p "${pkgdir}/var/lib/casaos"
    mv "${_sysdir}/var/lib/casaos/www" "${pkgdir}/var/lib/casaos/"
}

