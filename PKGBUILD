# Maintainer: Alexander Fasching <fasching.a91@gmail.com>
# Contributor: brent s. <bts[at]square-r00t[dot]net>
# Bugreports can be filed at https://github.com/alexf91/AUR-PKGBUILDs

pkgname=('python-grpcio-tools' 'python2-grpcio-tools')
pkgver=1.22.0
pkgrel=1
pkgdesc="Python protobuf generator for GRPC"
arch=('x86_64' 'i686')
url="https://grpc.io/"
license=('Apache' )
_pkgname=grpcio-tools
install=
changelog=
noextract=()
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/g/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('0b733afb78ca60ce3ec0479cd0c4faf0d0d43ab2e015145d19f1c4736c79d0e3776813d0147e7e71f21f6cff2747eeb641fcf1399455936fd7b507bf38b38896')

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
