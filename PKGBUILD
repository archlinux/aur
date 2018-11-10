# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
_pkgname="lazr.restful"
pkgname="python2-lazr-restful"
pkgver="0.20.1"
pkgrel="1"
pkgdesc="Publish data model objects as RESTful web services by annotating their Zope interfaces."
arch=('i686' 'x86_64')
url="https://launchpad.net/lazr.restful"
license=('LGPL3')
depends=('python>=2.5')
makedepends=('python>=2.5')
provides=("${pkgname}")
source=("${url}/trunk/${pkgver}/+download/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('0386643d7fb6e579899b9854f840d01cbeae21ea2496eb4b6d570525d72330ea')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=4 sw=4 ft=sh et syn=sh ft=sh:
