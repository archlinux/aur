# Maintainer: qwjyh <urataw421 at gmail dot com>

pkgname=python-opcua-widgets
_name=${pkgname#python-}
pkgver=0.6.1
pkgrel=1
pkgdesc="OPC-UA Widgets"
depends=('python' 'python-opcua-asyncio' 'python-pyqt5')
arch=('any')
url="https://github.com/FreeOpcUa/opcua-widgets"
license=('GPL-3.0-only')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('c0ef82f9f169f6bf1ff639906d2d8d2a4ec1618186845345bf2de18278c15199')

package() {
    python -m installer --destdir="$pkgdir" "${_name//-/_}-$pkgver-py3-none-any.whl"
}
