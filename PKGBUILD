# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=python-twine
_pyname=twine
pkgver=1.5.0
pkgrel=1
pkgdesc='A utility for interacting with PyPI'
arch=('any')
url='https://pypi.python.org/pypi/twine'
license=('APACHE')
depends=('python' 'python-setuptools' 'python-requests>=2.0' 'python-pkginfo')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('12948245aeb59acf32f663e1d81fed34')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
