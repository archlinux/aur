 # Maintainer: Mike Cuche <cuche@gmx.com>

pkgname=python-omgifol
pkgver=0.5.1
pkgrel=1
pkgdesc="A Python library for manipulating Doom WAD files"

url='https://github.com/devinacker/omgifol'
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')

source=("https://github.com/devinacker/omgifol/archive/${pkgver}.tar.gz")

sha256sums=('5bf1008037e956e07fdddf0db5f54f5df1b11669d4ebc5845d89e7fa6c2fdf90')

package() {
  cd "${srcdir}/omgifol-${pkgver}"
  python ./setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
