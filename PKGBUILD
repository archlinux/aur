# Maintainer: czyt <czytcn@gmail.com>
pkgname=nmem-cli
pkgver=0.9.12
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
sha256sums=('47b96cae5efe0e9befc08250f7fbfe1903cafeea40712e401b977f3668818f3d')

package() {
    python -m installer --destdir="$pkgdir" "${srcdir}/${_wheelname}"
}
