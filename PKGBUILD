# Maintainer: Brad Erhart <brae.04+aur@gmail.com>

pkgbase=python-flask-paginate
pkgname=python-flask-paginate
_name=${pkgname#python-}
pkgver=0.5.5
pkgrel=1
pkgdesc="A simple paginate extension for flask"
arch=('any')
license=('BSD')
url="https://pypi.org/project/flask-paginate"
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/${_name/-/_}-$pkgver-py2.py3-none-any.whl")
sha512sums=('ffba99a5167c55faa3eee1afcb71313fc1bce10ad47949a728c51defb8124c8becfcae3cb2ab03780bf76bbebb6a42b2689358ab8c4dd37075c3b94ab27f088e')

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
