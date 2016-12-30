# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-proc
pkgver=0.10.1
pkgrel=1
pkgdesc="Simple interface to Linux process information"
arch=("any")
url="https://github.com/xolox/python-proc"
license=("MIT")
depends=("python" "python-coloredlogs" "python-executor" "python-humanfriendly" "python-property-manager")
makedepends=("python-setuptools")
source=("https://github.com/xolox/python-proc/archive/${pkgver}.tar.gz")
sha512sums=("b1c41ec143470994a7239b033123113be3eb9f95ee78f14d3fd92f7fbb9061bc35776b71e037e7ab7b538e989c7e10cb89f0ff1f6782a53c9724ecc4fa051a67")

package() {
    cd "python-proc-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-proc/LICENSE.txt"
}
