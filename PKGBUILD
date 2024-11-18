# Maintainer: Octopus118 <idlansdowne at gmail dot com>
pkgname=python-moteus-gui
_name=${pkgname#python-}
pkgver=0.3.74
pkgrel=2
pkgdesc="moteus brushless controller graphical user interfaces"
url="https://pypi.org/project/moteus-gui/"
arch=('any')
license=('Apache-2.0')
depends=('pyside6' 'python-asyncqt' 'python-matplotlib' 'python-moteus' 'python-numpy' 'python-qtconsole' 'python-qtpy')
makedepends=('python-installer')

source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")

sha256sums=('076ead401f9cc93992ed3492db3c0fc94ba7a80e23368bcd9063f69f0a999080')

package() {
    python -m installer --destdir="$pkgdir" "${_name//-/_}-$pkgver-py3-none-any.whl"
}
