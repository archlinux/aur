# Maintainer: Phillip K. Samuel < pintert3 at protonmail dot com >

pkgname=python-engineering-notation
_name=engineering-notation
pkgver=0.6.0
pkgrel=1
pkgdesc="Human-readable engineering notation"
arch=('any')
url="https://pypi.org/project/engineering-notation"
license=('MIT')
depends=()
makedepends=('python-installer')
source=("engineering_notation-$pkgver-py3-none-any.whl::https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
noextract=("engineering_notation-$pkgver-py3-none-any.whl")
sha256sums=(1ea1e450d575b4804723d0711b0609d2711dffac2f4b5548ee632c16a636d9f6)

package() {
	python -m installer --destdir="$pkgdir" engineering_notation-$pkgver-py3-none-any.whl
}
