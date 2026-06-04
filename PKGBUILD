# Maintainer: czyt <czytcn@gmail.com>
pkgname=nmem-cli
pkgver=0.8.8
pkgrel=3
pkgdesc="CLI and TUI for Nowledge Mem - AI memory management"
arch=('any')
url="https://mem.nowledge.co/docs/cli"
license=('MIT')
depends=('python' 'python-rich' 'python-httpx' 'python-pyperclip' 'python-qrcode' 'python-textual')
makedepends=('python-installer')
_wheelname="nmem_cli-${pkgver}-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/n/nmem-cli/${_wheelname}")
noextract=("${_wheelname}")
sha256sums=('3a004d23765744e134bd12552626bdea1068989bb671bb174c96473d5e5e7f32')

package() {
    python -m installer --destdir="$pkgdir" "${srcdir}/${_wheelname}"
}
