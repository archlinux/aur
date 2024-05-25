# Maintainer: Henri Osmankäämi <cg+ohpxnebbnhe at jakorasia dot info>

pkgname='python-buckaroo'
_pkgname=buckaroo
pkgver='0.6.11'
pkgrel=1
pkgdesc="Buckaroo - GUI Data wrangling for pandas"
url="https://github.com/paddymul/buckaroo"
depends=('python')
makedepends=(python-installer)
license=('BSD-3-Clause')
arch=('any')
source=("https://files.pythonhosted.org/packages/py3/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver-py3-none-any.whl")
sha256sums=('c749e6591930c42084a0ea59d61254a0c66fe42f3a8c0498d8a565cab4aab9fe')

package() {
    python -m installer --destdir="$pkgdir" $_pkgname-$pkgver-py3-none-any.whl
}
