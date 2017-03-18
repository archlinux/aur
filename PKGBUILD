# Maintainer: Carlo Teubner <carlo.teubner@gmail.com>
pkgname=pacmods
pkgver=0.1.0
pkgrel=1
pkgdesc="Tool to show changes to system config files"
arch=('any')
url="https://github.com/c4rlo/pacmods"
license=('MIT')
depends=('python' 'python-setuptools' 'pyalpm')
options=(!emptydirs)
source=("https://github.com/c4rlo/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('b413c09cb03a075acfec88b5366b3d7681e96220f1a8cc79c15d58e1ae7667fc')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
