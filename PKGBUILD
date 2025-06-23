# Contributor: brent s. <bts[at]square-r00t[dot]net>
_pkgname=mdstat
pkgname=python-${_pkgname}
pkgver=1.0.4
pkgrel=1
pkgdesc="Convert your /proc/${_pkgname} file into an object usable in Python"
arch=(i686 x86_64)
url="https://github.com/truveris/py-${_pkgname}"
license=(MIT)
depends=(python mdadm)
makedepends=(python-setuptools)
source=(https://files.pythonhosted.org/packages/source/m/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('a2894fd20e70f78aa1310792f4322524321d7151085e6caef8e089f05c40334bfff06162b2854b50f33111d0073c4a9378781c79127ff6345eda50d8f9ad3e69')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}
