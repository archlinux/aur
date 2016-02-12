# Maintainer: brent s. <bts[at]square-r00t[dot]net>
pkgname=python-semantic_version
_pkgname=semantic_version
pkgver=2.5.0
pkgrel=1
pkgdesc="This is a Python library for parsing version strings via SemVer."
arch=('i686' 'x86_64')
url=("https://pypi.python.org/pypi/semantic_version/")
license=('custom')
depends=('python')
source=("https://pypi.python.org/packages/source/s/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('9a3f8e3ca00dcd2da16e30d55a4d4d99')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build install --root="${pkgdir}"
}

