# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-unstdlib
pkgver=1.7.2
pkgrel=1
pkgdesc="Unstandard Python library of useful and highly-reusable functions."
arch=("any")
url="https://github.com/shazow/unstdlib.py"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/ad/bd/420390e57167f667caa206576f715964b11ef20894d4b69455e425fe21c6/unstdlib-1.7.2.tar.gz")
sha256sums=("ef702a49bea7cefde837b7419f02d0b6274823cc51801ef5b9ba4ccb60227eb0")

package() {
    cd "unstdlib-${pkgver}"
    python setup.py install --root="${pkgdir}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-unstdlib/LICENSE"
}
