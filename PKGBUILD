# Maintainer: Manuel Domínguez López <mdomlop at gmail dot com>

_pkgver_year=2017
_pkgver_month=07
_pkgver_day=12

pkgname=wmdocker
pkgdesc="Docking System Tray."
pkgver=1.5.1
pkgrel=1
url="https://github.com/mdomlop/${pkgname}"

source=("https://github.com/mdomlop/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('0fdbe0b423724f01e21294a626f8791b')

license=('GPL2')
depends=('libx11')
arch=('x86_64' 'i686')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make  XLIBPATH=/usr/lib
    }

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make install PREFIX=${pkgdir}/usr
}
