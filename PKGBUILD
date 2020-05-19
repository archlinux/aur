# Maintainer: Brad Erhart <brae.04+aur@gmail.com>

pkgbase=python-toml-sort
pkgname=python-toml-sort
_name=${pkgname#python-}
pkgver=0.18.0
pkgrel=1
pkgdesc="Command line utility to sort and format your TOML files"
arch=('any')
license=('MIT')
url="https://pypi.org/project/toml-sort"
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name/-/_}-$pkgver-py3-none-any.whl")
sha512sums=('0f64349311a8d26ccf270257553a664bc906bee104556edeb581d3465245c4262f8d65e998a0b493243a1af60cce15831ea8f05c6cfce2b67efbf100cecdeb83')

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
