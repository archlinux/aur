# Maintainer: Platon Pronko <platon7pronko@gmail.com>

pkgname='python-lsp-jsonrpc'
pkgver=1.0.0
pkgrel=1
pkgdesc="Fork of the python-jsonrpc-server project, maintained by the Spyder IDE team and the community"
arch=("any")
url="https://github.com/python-lsp/python-lsp-jsonrpc"
license=("MIT")
depends=(
    "python-ujson"
)
makedepends=("python-setuptools")

source=("https://github.com/python-lsp/python-lsp-jsonrpc/archive/v${pkgver}.tar.gz")
sha256sums=('058f21fa9e5c49fbb978c3f92c4b0ed84f3a859dc6568632cb69ddec2bcb38c0')

prepare() {
  cd "${srcdir}/python-lsp-jsonrpc-${pkgver}"
}

package() {
  cd "${srcdir}/python-lsp-jsonrpc-${pkgver}"
  python setup.py install --root=${pkgdir} 
}
