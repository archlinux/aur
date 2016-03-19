# Maintainer: Matthew Gamble

pkgname=python-dictobject
pkgver=0.1.2
pkgrel=1
pkgdesc="Python DictObject allows attribute access on dicts."
arch=('any')
url="https://pypi.python.org/pypi/DictObject/${pkgver}"
license=("GPL")
depends=('python' 'python-luckydonald-utils')
makedepends=('python-setuptools')
source=(
    "https://pypi.python.org/packages/source/D/DictObject/DictObject-${pkgver}.tar.gz"
)
sha256sums=('1243b6458516b839c59116e036a17d86a5767d488b2e7d9d03a10fbda1a3877a')

package() {
    cd "DictObject-${pkgver}"
    python setup.py install --root="$pkgdir"
}
