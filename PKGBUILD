# Maintainer: brent s. <bts[at]square-r00t[dot]net>
pkgname=python-semantic_version
_pkgname=semantic_version
pkgver=2.4.2
pkgrel=1
pkgdesc="This is a Python library for parsing version strings via SemVer."
arch=('i686' 'x86_64')
url=("https://pypi.python.org/pypi/semantic_version/")
license=('custom')
depends=('python')
source=("https://pypi.python.org/packages/source/d/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('fd7d5ade76e78d8540b9a4044496a57c')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py build install --root="${pkgdir}"
}

