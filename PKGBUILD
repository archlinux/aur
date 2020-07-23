# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-google-pasta
pkgver=0.2.0
pkgrel=1
pkgdesc='Library to refactor python code through AST manipulation'
arch=('any')
url='https://github.com/google/pasta'
license=('Apache')
depends=('python-six')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/google/pasta/archive/v${pkgver}.tar.gz")
sha256sums=('b9e3bcf5ab79986e245c8a2f3a872d14c610ce66904c4f16818342ce81cf97d2')

package() {
  cd "pasta-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}