# Maintainer: czyt <czytcn@gmail.com>
pkgname=nmem-cli
pkgver=0.9.26
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
sha256sums=('ab1d6072fdd1169e7005309e30758d25f1616f70f13f2faa36e54da2f1d22332')

package() {
    python -m installer --destdir="$pkgdir" "${srcdir}/${_wheelname}"
}
