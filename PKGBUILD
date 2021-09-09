# Maintainer: Platon Pronko <platon7pronko@gmail.com>

pkgname="pyp"
pkgver="0.3.4"
pkgrel=1
pkgdesc="Easily run Python at the shell! Magical, but never mysterious."
arch=("any")
url="https://github.com/hauntsaninja/pyp"
license=("MIT")
depends=("python" "python-astunparse")
makedepends=("python-setuptools")
source=("https://github.com/hauntsaninja/pyp/archive/v${pkgver}.tar.gz")
sha256sums=('a3275b7e27039ef56a9dec70c32e1e45a6b298024eb8a553d46aa2e98af13c4b')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
