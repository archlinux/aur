
pkgname=('python-hjson' 'python2-hjson')
_pkgname="hjson"
pkgver=1.5.3
pkgrel=1
pkgdesc="JSON for Humans, allows comments and is less error prone."
arch=(any)
url="https://github.com/laktak/hjson-py"
license=('MIT')
depends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/h/${_pkgname}/${_pkgname}-${pkgver}.zip")
md5sums=('9fee8f096a27b1c351877b466dfa27b3')
package_python-hjson() {
  provides=('python-hjson')
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python3 setup.py clean
  python3 setup.py install --root=${pkgdir}/ --optimize=1
}

package_python2-hjson() {
  provides=('python2-hjson')
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py clean
  python2 setup.py install --root=${pkgdir}/ --optimize=1
}


# vim:set ts=2 sw=2 et:
