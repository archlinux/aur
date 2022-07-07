# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-x21
pkgver=0.3.3
pkgrel=1
pkgdesc="Building tool"
arch=('x86_64')
url='https://pypi.org/project/x21'
license=('custom:proprietary')
depends=('python')
makedepends=('python-installer')
_py=cp310
source_x86_64=("https://files.pythonhosted.org/packages/$_py/x/x21/x21-$pkgver-$_py-$_py-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
sha256sums_x86_64=('8f40ba47efc556aae0400bdebbc32281ab4b586c9399da4f307ffdf80b03a4f8')

package() {
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" *.whl
}
