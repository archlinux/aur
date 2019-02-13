# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=('python-grpcio-tools' 'python2-grpcio-tools')
pkgver=1.18.0
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
sha512sums=('5c581a41804eb5dbad34829c9dd32253849484dc6e92d0bbd43b816ec3b45b741b23bffeb9969bf2dc3b7183cb05135f6dcc20f5b260c07f7173b9688c9852c0'
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
