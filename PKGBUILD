# Maintainer: Platon Pronko <platon7pronko@gmail.com>

pkgname='python-lsp-server'
pkgver=1.1.0
pkgrel=1
pkgdesc="Fork of the python-language-server project, maintained by the Spyder IDE team and the community"
arch=("any")
url="https://github.com/python-lsp/python-lsp-server"
license=("MIT")
depends=(
    "python-jedi"
    "python-lsp-jsonrpc"
    "python-pluggy"
    "python-ujson"
)
makedepends=("python-setuptools")

source=("https://github.com/python-lsp/python-lsp-server/archive/v${pkgver}.tar.gz")
sha256sums=('987eb87073fca65bd1b0d32e408935f2146a98d33ae06d716d00969fc8c935b3')

prepare() {
  cd "${srcdir}/python-lsp-server-${pkgver}"
}

package() {
  cd "${srcdir}/python-lsp-server-${pkgver}"
  python setup.py install --root=${pkgdir} 
}
