# Maintainer: Octopus118 <idlansdowne at gmail dot com>
pkgname=python-moteus-gui
_name=${pkgname#python-}
pkgver=0.3.70
pkgrel=1
pkgdesc="moteus brushless controller graphical user interfaces"
url="https://pypi.org/project/moteus-gui/"
arch=('any')
license=('Apache-2.0')
depends=('pyside2' 'python-asyncqt' 'python-matplotlib' 'python-moteus' 'python-numpy' 'python-qtconsole' 'python-qtpy')
makedepends=('python-installer')

source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")

sha256sums=('7458a0bb915eb19c0d5b74fece101c5841ac04b9d60070e9efe9e0b2648075cd')

package() {
    python -m installer --destdir="$pkgdir" "${_name//-/_}-$pkgver-py3-none-any.whl"
}
