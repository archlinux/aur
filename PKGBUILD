# Maintainer: Platon Pronko <platon7pronko@gmail.com>

pkgname='python-lsp-server'
pkgver=1.0.1
pkgrel=1
pkgdesc="Fork of the python-language-server project, maintained by the Spyder IDE team and the community"
arch=("any")
url="https://github.com/python-lsp/python-lsp-server"
license=("MIT")
depends=(
    "python-jedi"
    "python-jsonrpc-server"
    "python-pluggy"
    "python-ujson"
)
makedepends=("python-setuptools")

source=("https://github.com/python-lsp/python-lsp-server/archive/v${pkgver}.tar.gz")
sha256sums=('b049d9a02cc568814d56278df5e95bcce455182ba7115dcd76b3212ef80f278f')

prepare() {
  cd "${srcdir}/python-lsp-server-${pkgver}"
}

package() {
  cd "${srcdir}/python-lsp-server-${pkgver}"
  python setup.py install --root=${pkgdir} 
}
