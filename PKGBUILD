# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-flufl-i18n')
_pkgbase='flufl.i18n'
pkgver=1.1.3
pkgrel=1
pkgdesc="A high level API for Python internationalization"
arch=(any)
url="https://launchpad.net/flufl.i18n"
license=('LGPL')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/f/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('bb743c1101936138edf6f6b0dd9f77f157ca6b5f38c608f440fd16b59c4c5130')
makedepends=('python-setuptools')

package_python-flufl-i18n() {
  depends=('python')
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
