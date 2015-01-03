# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=python-twine
_pyname=twine
pkgver=1.4.0
pkgrel=1
pkgdesc='A utility for interacting with PyPI'
arch=('any')
url='https://pypi.python.org/pypi/twine'
license=('APACHE')
depends=('python' 'python-requests>=2.0' 'python-pkginfo')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('631e1551ac4caf89cd6ede7811d7eaa4')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
