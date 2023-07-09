# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgbase=python-cashier
pkgname='python-cashier'
_name=${pkgname#python-}
pkgver=1.3
pkgrel=4
pkgdesc='Persistent caching for python functions.'
arch=('any')
url='https://pypi.org/project/cashier/'
license=('MIT')
depends=('python')
makedepends=(
  'python-setuptools'
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.zip")
sha512sums=('3e1033455df18651a034e0fbe98255fc2af0a44684e026d5f97e0141bc051f0a2e41368677d4675e19f46ae14130cea94b1f963227592cdbd3b6a044b74a6136')

package() {
  cd cashier-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}
