# Maintainer: czyt <czytcn@gmail.com>
pkgname=nmem-cli
pkgver=0.10.9
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
sha256sums=('142c41bd764588d40f79767ed00936e121c26865725463aef3f10451022c4a28')

package() {
    python -m installer --destdir="$pkgdir" "${srcdir}/${_wheelname}"
}
