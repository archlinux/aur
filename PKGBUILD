# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=('python-grpcio-tools' 'python2-grpcio-tools')
pkgver=1.10.0
pkgrel=1
pkgdesc="Python protobuf generator for GRPC"
arch=('any')
url="https://grpc.io/"
license=('Apache' )
_pkgname=grpcio-tools
install=
changelog=
noextract=()
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/g/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('ee91398c5f7510162ae54ad343c4b21614b54f55d6c596d3fe9d26f64d3b8b20cc13059659a52d715ac969359773dd11e848dbc56daf722b51e48ecac95f81a9'
            'SKIP')

package_python-grpcio-tools() {
  depends=('python' 'python-grpcio' 'python-protobuf')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-grpcio-tools() {
  depends=('python2' 'python2-grpcio' 'python2-protobuf')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
