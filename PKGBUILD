# Maintainer: Platon Pronko <platon7pronko@gmail.com>

pkgname='python-lsp-server'
pkgver=1.2.1
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
sha256sums=('5408cffb405bef5e74d5a9de4ba6f1f45e5ab1c5d67755824a0beb31dfb489a3')

prepare() {
  cd "${srcdir}/python-lsp-server-${pkgver}"
}

package() {
  cd "${srcdir}/python-lsp-server-${pkgver}"
  python setup.py install --root=${pkgdir} 
}
