# Maintainer: Platon Pronko <platon7pronko@gmail.com>

pkgname="pyp"
pkgver="0.3.2"
pkgrel=1
pkgdesc="Easily run Python at the shell! Magical, but never mysterious."
arch=("any")
url="https://github.com/hauntsaninja/pyp"
license=("MIT")
depends=("python" "python-astunparse")
makedepends=("python-setuptools")
source=("https://github.com/hauntsaninja/pyp/archive/v${pkgver}.tar.gz")
sha256sums=('aafb7128fc6404c9cf87348d564bbe0b512d27b885cf00ec82c2cfb71d28800f')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
