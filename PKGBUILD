# Maintainer: Phil Schaf <flying-sheep@web.de>

_pypiname=pdfrw
pkgname=python-pdfrw
pkgver=0.2
pkgrel=1
pkgdesc='Convert restructured text to PDF via reportlab.'
arch=('any')
url="https://github.com/pmaupin/$_pypiname"
license=('MIT')
makedepends=('python-pip')
source=("https://pypi.python.org/packages/py2.py3/p/$_pypiname/$_pypiname-$pkgver-py2.py3-none-any.whl")
noextract=("$_pypiname-$pkgver-py2.py3-none-any.whl")
md5sums=('06af2f23253e5199cd4f5993385a5327')

package() {
	pip install --root="$pkgdir/" "$srcdir/$_pypiname-$pkgver-py2.py3-none-any.whl"
}