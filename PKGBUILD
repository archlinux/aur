# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testflo
pkgver=1.4.1
pkgrel=1
pkgdesc="A simple flow-based testing framework"
url="https://github.com/RaRe-Technologies/testflo"
license=('Apache')
arch=('any')
depends=('python-coverage')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/t/testflo/testflo-$pkgver.tar.gz")
sha512sums=('e69e9c18bb611737b38cc9c088e6e19e77a29b7070081a948d5c2d3a13b6222b5dd0cd88c11518115739273fb816bb1464e128e7e44a3bbb721286cb7dee0327')

build() {
  cd testflo-$pkgver
  python setup.py build
}

package() {
  cd testflo-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
