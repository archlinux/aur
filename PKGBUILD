# Maintainer: Octopus118 <idlansdowne at gmail dot com>
pkgname=python-moteus-gui
_name=${pkgname#python-}
pkgver=0.3.73
pkgrel=2
pkgdesc="moteus brushless controller graphical user interfaces"
url="https://pypi.org/project/moteus-gui/"
arch=('any')
license=('Apache-2.0')
depends=('pyside6' 'python-asyncqt' 'python-matplotlib' 'python-moteus' 'python-numpy' 'python-qtconsole' 'python-qtpy')
makedepends=('python-installer')

source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")

sha256sums=('ff0f36626c8e258ae4e2a8176b959e7434bcf6402472129ed2cee99bb617d9a2')

package() {
    python -m installer --destdir="$pkgdir" "${_name//-/_}-$pkgver-py3-none-any.whl"
}
