# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jesus Alvarez
# Contributor: Simon Conseil <contact+aur at saimon dot org>

pkgname=python-baker
pkgver=1.3
pkgrel=5
pkgdesc="Easy, powerful access to Python functions from the command line."
arch=('any')
url='https://pypi.org/project/Baker'
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/B/Baker/Baker-$pkgver.tar.gz")
sha256sums=('2d81e99af7d7d6441297a0c13de023fe3f1510718e89d2baacea917ee09d154d')

build() {
  cd "Baker-$pkgver"
  python setup.py build
}

package() {
  cd "Baker-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
