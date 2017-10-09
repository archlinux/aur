# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=('python-conversion' 'python2-conversion')
pkgver=0.0.3
pkgrel=2
pkgdesc="Utility functions to convert strings to Python types."
arch=( 'i686' 'x86_64' )
url="http://github.com/rca/conversion"
license=( 'APACHE' )
depends=( 'python' 'python2' )
makedepends=( 'python' 'python2' 'python-setuptools' 'python2-setuptools' )
_pkgname=conversion
install=
changelog=
noextract=()
source=("https://files.pythonhosted.org/packages/source/c/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('ad916391f64618daf5c81d5805ee7f72d78c3a82abac55d58b94f22c96d1b8a06f3be20b41f4a1a62395b373e51552237b07f3322ee568f28dc6d0c261075be3'
            'SKIP')

package_python-conversion() {
  depends=('python')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-conversion() {
  depends=('python2')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
