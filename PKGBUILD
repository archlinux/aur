# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-proc
pkgver=0.11
pkgrel=1
pkgdesc="Simple interface to Linux process information"
arch=("any")
url="https://github.com/xolox/python-proc"
license=("MIT")
depends=("python" "python-coloredlogs" "python-executor" "python-humanfriendly" "python-property-manager")
makedepends=("python-setuptools")
source=("https://github.com/xolox/python-proc/archive/${pkgver}.tar.gz")
sha512sums=("b023d20ba3f28c4ed81b95ba0b00b3ca808229cea44b4a213fcbcad7af1a690cc20e6df1e11059473c24689d058b8ea511692a66fe8a440f732a4d69c6e85395")

package() {
    cd "python-proc-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-proc/LICENSE.txt"
}
