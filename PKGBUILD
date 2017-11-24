# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
pkgname=('python-semantic_version' 'python2-semantic_version')
_pkgname=semantic_version
pkgver=2.6.0
pkgrel=1
pkgdesc="This is a Python library for parsing version strings via SemVer."
arch=('any')
url="https://pypi.python.org/pypi/semantic_version/"
license=('custom')
depends=('python' 'python2')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/s/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
	"${_pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('805449e7219aaa59d28cc267c27a6abab5cbbbfd52c72d66f24bcace39c9f864e4ed944a3dc614e14a700a5bc92272fa6420312f3169b01a4cfd9ddf3ffb42d6'
            'SKIP')

package_python-semantic_version() {
  depends=('python')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build install --root="${pkgdir}"
}

package_python2-semantic_version() {
  depends=('python2')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build install --root="${pkgdir}"
}
