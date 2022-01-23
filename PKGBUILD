# Maintainer: Matthew Gamble

pkgname=python-idiotscript
pkgver=1.1.1
pkgrel=6
pkgdesc="An easier, less powerful alternative to regular expressions"
arch=("any")
url="https://github.com/djmattyg007/IdiotScript"
license=("Unlicense")
depends=("python")
makedepends=("python-setuptools")
source=("https://github.com/djmattyg007/IdiotScript/archive/${pkgver}.zip")
sha256sums=("38016ff7734ba9f0f82bdb34076995ac96960f33ec98608907ad18ae0c2b08c2")

package() {
    cd "IdiotScript-${pkgver}"
    PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-idiotscript/LICENSE.txt"
}
