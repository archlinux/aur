# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-x21
pkgver=0.1.8
pkgrel=1
pkgdesc="Building tool"
arch=('x86_64')
url='https://pypi.org/project/x21'
license=('custom:proprietary')
depends=('python')
makedepends=('python-installer')
_py=cp310
source_x86_64=("https://files.pythonhosted.org/packages/$_py/x/x21/x21-$pkgver-$_py-$_py-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
sha256sums_x86_64=('7dfd93a2c195f7147b6ea2ffe5df49c5025328828ba1f0fe60f83dc735151903')

package() {
	export PYTHONHASHSEED=0
	python -m installer --destdir="$pkgdir/" *.whl
}
