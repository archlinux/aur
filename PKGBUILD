# Contributor: Jesus Alvarez
# Maintainer: Simon Conseil <contact+aur at saimon dot org>
pkgname=python-radon
pkgver=1.2
pkgrel=1
pkgdesc="Radon is a tool for Python that computes various metrics from the source code."
arch=('any')
url="https://github.com/rubik/radon"
license=('MIT')
depends=('python' 'python-baker' 'python-colorama')
source=("http://pypi.python.org/packages/source/r/radon/radon-${pkgver}.tar.gz")
md5sums=('a4c661620ff2416475fab4a03c8db125')

package() {
  cd "$srcdir/radon-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
