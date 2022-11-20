 # Maintainer: Mike Cuche <cuche@gmx.com>

pkgname=python-omgifol
pkgver=0.5.0
pkgrel=2
pkgdesc="A Python library for manipulating Doom WAD files"

url='https://github.com/devinacker/omgifol'
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')

source=("https://github.com/devinacker/omgifol/archive/${pkgver}.tar.gz")

sha256sums=('978e4e1f725b3badbfb3a69e74d366df4ccdc8029bfa2e60b1776fff67d2d802')

package() {
  cd "${srcdir}/omgifol-${pkgver}"
  python ./setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
