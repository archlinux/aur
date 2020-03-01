# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testflo
pkgver=1.4.0
pkgrel=1
pkgdesc="A simple flow-based testing framework"
url="https://github.com/RaRe-Technologies/testflo"
license=('Apache')
arch=('any')
depends=('python-coverage')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/t/testflo/testflo-$pkgver.tar.gz")
sha512sums=('d18bff5cd3be791678a5963824867a6fe8789c48c3bd989e1eeabf9098c78b28a8228aacba318912d1aeb75537ebf5977b3112cae58a361753cceb09a98a0079')

build() {
  cd testflo-$pkgver
  python setup.py build
}

package() {
  cd testflo-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
