pkgname=casaos-ui
pkgver=0.4.0
pkgrel=1
pkgdesc="The front-end of CasaOS,build with VueJS."
arch=('any')
url="https://github.com/IceWhaleTech/CasaOS-UI"
license=('unknown')
groups=('casaos')
source=(
    ${url}/releases/download/v${pkgver}/linux-all-casaos-v${pkgver}.tar.gz
)
sha256sums=(SKIP)
package() {
    _sysdir="${srcdir}/build/sysroot"
    mkdir -p "${pkgdir}/var/lib/casaos"
    mv "${_sysdir}/var/lib/casaos/www" "${pkgdir}/var/lib/casaos/"
}