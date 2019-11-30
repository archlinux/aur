# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-flufl-i18n')
_pkgbase='flufl.i18n'
pkgver=2.0.2
pkgrel=1
pkgdesc="A high level API for Python internationalization"
arch=(any)
url="https://gitlab.com/warsaw/flufl.i18n"
license=('LGPL')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/f/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('500976b41cc21a6a927dabce189865e14e4593c9982ab193b50a749b8a6e4fb3')
makedepends=('python-setuptools')

package_python-flufl-i18n() {
  depends=('python')
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
