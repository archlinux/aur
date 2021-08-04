# Maintainer: Platon Pronko <platon7pronko@gmail.com>

pkgname='python-lsp-server'
pkgver=1.2.0
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
sha256sums=('155a402420f060d0f56efdf3ee6dfe4c053fc9350c5ae395d806fbbe45a0acbf')

prepare() {
  cd "${srcdir}/python-lsp-server-${pkgver}"
}

package() {
  cd "${srcdir}/python-lsp-server-${pkgver}"
  python setup.py install --root=${pkgdir} 
}
