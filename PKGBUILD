# Maintainer: Brad Erhart <brae.04+aur@gmail.com>

pkgbase=python-flask-paginate
pkgname=python-flask-paginate
_name=${pkgname#python-}
pkgver=0.8.1
pkgrel=2
pkgdesc="A simple paginate extension for flask"
arch=('any')
license=('BSD')
url="https://pypi.org/project/flask-paginate"
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/${_name/-/_}-$pkgver-py2.py3-none-any.whl")
sha512sums=(b0afc4a11b2ddc87386775cd553aa7ca0a5c1f991ea8ec64ed3c5c8e1138eaec9922a320cb56609716e16154a830ca1ca913012b6c60a76005799f1c25077e53)

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
