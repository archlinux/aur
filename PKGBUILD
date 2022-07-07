# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=blacktex
pkgver=0.8.6
pkgrel=1
pkgdesc="LaTex code prettifier and formatter"
arch=('any')
url='https://pypi.org/project/blacktex'
license=('custom:proprietary')
depends=('python-pylatexenc' 'python-kgt' 'python-x21')
optdepends=('python-importlib-metadata: required for python<3.8')
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/py3/b/$pkgname/$pkgname-$pkgver-py3-none-any.whl")
sha256sums=('885438b798e9edaf4234cca9f7f7a652dc0a2e1daa71ab8bf7aede49dd4383d5')

package() {
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" *.whl
}
