# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname='python-backoff'
_name=${pkgname#python-}
pkgver=2.2.0
pkgrel=1
pkgdesc="Function decoration for backoff and retry."
arch=('any')
url="https://github.com/litl/backoff"
license=('MIT')
makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('5af5422b7953cad4066883b6100baa6340bed58fe9bc5014b6bb3b5d764d28c2b5aff6dbcc8301ce81ec14ec05071f0bb83eade3f007bbea490327da225ca026')

package() {
  cd backoff-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
}
