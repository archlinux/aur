# Maintainer: Platon Pronko <platon7pronko@gmail.com>

pkgname="pyp"
pkgver="1.0.0"
pkgrel=1
pkgdesc="Easily run Python at the shell! Magical, but never mysterious."
arch=("any")
url="https://github.com/hauntsaninja/pyp"
license=("MIT")
depends=("python" "python-astunparse")
makedepends=("python-setuptools")
source=("https://github.com/hauntsaninja/pyp/archive/v${pkgver}.tar.gz")
sha256sums=('da403d16d3a7c6d2f6648ebb782ebd322fb6725366e2622f4ef3ea5f933449c7')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
