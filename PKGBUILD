# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=blacktex
pkgver=0.8.3
pkgrel=1
pkgdesc="LaTex code prettifier and formatter"
arch=('any')
url='https://pypi.org/project/blacktex'
license=('custom:proprietary')
depends=('python-pylatexenc' 'python-kgt' 'python-x21')
optdepends=('python-importlib-metadata: required for python<3.8')
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/py3/b/$pkgname/$pkgname-$pkgver-py3-none-any.whl")
sha256sums=('6ad33fedfe13ecedb25d7df6e6db4affb74d384d22df38375bbe5e30198cc6f8')

package() {
	export PYTHONHASHSEED=0
	python -m installer --destdir="$pkgdir/" *.whl
}
