# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname='python-backoff'
_name=${pkgname#python-}
pkgver=2.2.1
pkgrel=1
pkgdesc="Function decoration for backoff and retry."
arch=('any')
url="https://github.com/litl/backoff"
license=('MIT')
makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('051baabb07714a8a2248899546a5eb6322157d7c61ff4cd94037fa497081ac01927e49713319cb78be504171c06e920462e1ed740e8bbe086bfba952cb74145b')

package() {
  cd backoff-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
}
