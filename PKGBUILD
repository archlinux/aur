# Maintainer: Lorenz Steinert <lorenz AT steinerts DOT de>

pkgname=('python2-flufl-i18n')
_pkgbase='flufl.i18n'
pkgver=1.1.3
pkgrel=1
pkgdesc="A high level API for Python internationalization"
arch=(any)
url="https://gitlab.com/warsaw/flufl.i18n"
license=('LGPL')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/f/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('bb743c1101936138edf6f6b0dd9f77f157ca6b5f38c608f440fd16b59c4c5130')
makedepends=('python2-setuptools')

package_python2-flufl-i18n() {
  depends=('python2')
  cd "$srcdir/$_pkgbase-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
