# Maintainer: czyt <czytcn@gmail.com>
pkgname=nmem-cli
pkgver=0.9.17
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
sha256sums=('944158d2ddb9ea0a1a42d3df90d174490cdb74f2d303dd6af57ff4ab648d0471')

package() {
    python -m installer --destdir="$pkgdir" "${srcdir}/${_wheelname}"
}
