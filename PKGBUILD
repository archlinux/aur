# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=python-lrzip
pkgver=1.0.0
pkgrel=2
pkgdesc="Python bindings to LRZIP (https://github.com/ckolivas/lrzip)"
arch=( 'i686' 'x86_64' )
url="https://pypi.python.org/pypi/lrzip"
license=( 'LGPL3' )
depends=( 'python' 'python2' 'lrzip' )
makedepends=( 'python' 'python2' 'lrzip' )
_pkgname=lrzip
install=
changelog=
noextract=()
source=("https://files.pythonhosted.org/packages/source/l/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('ee1aef3199da84754e7b2e0f55d4ee9fbae46a308b811b68f533d04c803f1754be3cac0a1d1809baaff5e267762b9649b7ed6ab0e4ce67187ae6da25ef5d24ca'
            'SKIP')

package_python-lrzip() {
        depends=('python')
        cd "${srcdir}/${_pkgname}-${pkgver}"
        python3 setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-lrzip() {
        depends=('python2')
        cd "${srcdir}/${_pkgname}-${pkgver}"
        python2 setup.py install --root="${pkgdir}" --optimize=1
}
