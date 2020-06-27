# Maintainer: Platon Pronko <platon7pronko@gmail.com>

pkgname="pyp"
pkgver="0.3.3"
pkgrel=1
pkgdesc="Easily run Python at the shell! Magical, but never mysterious."
arch=("any")
url="https://github.com/hauntsaninja/pyp"
license=("MIT")
depends=("python" "python-astunparse")
makedepends=("python-setuptools")
source=("https://github.com/hauntsaninja/pyp/archive/v${pkgver}.tar.gz")
sha256sums=('944284cf0546fef48cd9f4a4edef459ee12e4cf1455e6eae7f99ecc920bf1cd9')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
