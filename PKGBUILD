# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-proc
pkgver=0.9.1
pkgrel=1
pkgdesc="Simple interface to Linux process information"
arch=("any")
url="https://github.com/xolox/python-proc"
license=("MIT")
depends=("python" "python-coloredlogs" "python-executor" "python-humanfriendly" "python-property-manager")
source=("https://github.com/xolox/python-proc/archive/${pkgver}.tar.gz")
md5sums=("9c6452e3025fbd80ee0eec10cc5aafc7")

package() {
    cd "python-proc-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-proc/LICENSE.txt"
}
