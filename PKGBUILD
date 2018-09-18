# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testflo
pkgver=1.3.1
pkgrel=1
pkgdesc="A simple flow-based testing framework"
url="https://github.com/RaRe-Technologies/testflo"
license=('Apache')
arch=('any')
depends=('python-six' 'python-coverage')
source=("https://pypi.io/packages/source/t/testflo/testflo-$pkgver.tar.gz")
sha512sums=('5d139ad87b1c4f19801888f25b870910bd810e5bf19ee29a61243562fa24ae5215a23b6280f64719d3fde5d2b3c528558816beed60bdf7a8e8c3999c5c275338')

build() {
  cd testflo-$pkgver
  python setup.py build
}

package() {
  cd testflo-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
