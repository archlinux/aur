# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-wire
pkgver=1.0.0
pkgrel=3
pkgdesc="A convenience wrapper around the built-in SQLite3 module in python"
arch=("any")
url="https://github.com/djmattyg007/python-wire"
license=("GPL3")
depends=("python")
makedepends=("python-setuptools")
source=("https://github.com/djmattyg007/python-wire/archive/${pkgver}.zip")
sha256sums=("0aaf5e3c280756fd723bf1b0fd68430da6f228d4b21a7eb9f9b18c33660bf978")

package() {
    cd "python-wire-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-wire/LICENSE"
}
