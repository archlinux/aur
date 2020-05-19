# Maintainer: Platon Pronko <platon7pronko@gmail.com>

pkgname="pyp"
pkgver="0.3.1"
pkgrel=1
pkgdesc="Easily run Python at the shell! Magical, but never mysterious."
arch=("any")
url="https://github.com/hauntsaninja/pyp"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
checkdepends=("python-setuptools" "python-pytest")
source=("https://github.com/hauntsaninja/pyp/archive/${pkgver}.tar.gz")
sha256sums=('d38ddb5d451cc072d4dc2443811bb53ec19e7142a94a6a460c7345196eb85360')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
