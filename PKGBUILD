# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=('python-grpcio-tools' 'python2-grpcio-tools')
pkgver=1.7.0
pkgrel=2
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
        "grpcio-tools-1.7.0.tar.gz.sig")
sha512sums=('9205f9804b13f01d2543e037496bcab1eb026d35daa0f3e3a3da87cfb561be5f61da09411757a82e08a21f77dcdc10694ea3aa1a4668c6689cdbc4223991e8d7'
            'SKIP')

package_python-grpcio-tools() {
  depends=('python')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-grpcio-tools() {
  depends=('python2')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
