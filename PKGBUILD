# This PKGBUILD is maintained at: https://github.com/majewsky/system-configuration/tree/master/holo
pkgname='holo'
pkgver=0.2.4
pkgrel=1
pkgdesc='Minimal configuration management'
arch=('x86_64')
url='https://github.com/majewsky/holo'
license=('GPL2')
makedepends=('go')
replaces=('holo-tools')
source=("https://github.com/majewsky/holo/archive/v${pkgver}.tar.gz")
md5sums=('39a4987509b430d2f1e0772708e59bfd')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
