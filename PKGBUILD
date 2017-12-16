# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-proc
pkgver=0.14
pkgrel=1
pkgdesc="Simple interface to Linux process information"
arch=("any")
url="https://github.com/xolox/python-proc"
license=("MIT")
depends=("python" "python-coloredlogs" "python-executor" "python-humanfriendly" "python-property-manager")
makedepends=("python-setuptools")
source=("https://github.com/xolox/python-proc/archive/${pkgver}.tar.gz")
sha512sums=("8f92ca025cc60f9ba17c178a6294714b111a1efda2466311f2643b40ed1d5a81f0da232cb65be54eb7b4d922f73c68b14f2fcf2e02725b7ddc20d3e2dbf1e357")

package() {
    cd "python-proc-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-proc/LICENSE.txt"
}
