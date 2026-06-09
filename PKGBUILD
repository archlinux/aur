# Maintainer: czyt <czytcn@gmail.com>
pkgname=nmem-cli
pkgver=0.9.0
pkgrel=1
pkgdesc="CLI and TUI for Nowledge Mem - AI memory management"
arch=('any')
url="https://mem.nowledge.co/docs/cli"
license=('MIT')
depends=('python' 'python-rich' 'python-httpx' 'python-pyperclip' 'python-qrcode' 'python-textual')
makedepends=('python-installer')
_wheelname="nmem_cli-${pkgver}-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/n/nmem-cli/${_wheelname}")
noextract=("${_wheelname}")
sha256sums=('737d9ff9ddb686e4db458f5b039302f45b119ca81120e3b1ce99ba0494656151')

package() {
    python -m installer --destdir="$pkgdir" "${srcdir}/${_wheelname}"
}
