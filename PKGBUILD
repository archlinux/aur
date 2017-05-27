# Maintainer: Henri Chain <henri@henri-chain.com>
_pkgname=protobuf-to-dict
pkgname=python-${_pkgname}
pkgver=0.1.5
pkgrel=1
pkgdesc="A teeny Python library for creating Python dicts from protocol buffers and the reverse. Useful as an intermediate step before serialisation (e.g. to JSON)."
url="https://github.com/benhodgson/protobuf-to-dict"
depends=('python' )
makedepends=('python-distribute' )
license=('CUSTOM')
arch=('any')
source=("https://github.com/kaporzhu/${_pkgname}/archive/v${pkgver}.zip")
md5sums=('8e18e6fbdc1e4139f3905ff92919e99f')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 
}
