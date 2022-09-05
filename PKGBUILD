# Maintainer: Phillip S. Kajubi <pintert3 at protonmail dot com>

pkgname=python-svgpathtools
pkgver=1.4.2
pkgrel=1
pkgdesc='Manipulate and analyze SVG Path objects and Bezier curves'
arch=('any')
url='https://github.com/mathandy/svgpathtools'
license=('MIT')
depends=('python' 'python-numpy' 'python-svgwrite' 'python-scipy')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d6d65159051b1471de6645606b59e1be0373750192665185ae976425c41b7fb0')


build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
