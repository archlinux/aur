# Maintainer: qwjyh <urataw421 at gmail dot com>

pkgname=python-opcua-client
_name=${pkgname#python-}
pkgver=0.8.4
pkgrel=1
pkgdesc="OPC-UA Client GUI"
depends=('python' 'python-pyqt5' 'python-numpy' 'python-opcua-asyncio' 'python-opcua-widgets')
arch=('any')
url="https://github.com/FreeOpcUa/opcua-client-gui"
license=('GPL-3.0-only')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('8ada075d24b5f4629e41f77024653ed38b1a2312c8d98fd349e91e7994ca3ae7')

package() {
    python -m installer --destdir="$pkgdir" "${_name//-/_}-$pkgver-py3-none-any.whl"
}
