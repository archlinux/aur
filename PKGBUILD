# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-proc
pkgver=1.0
pkgrel=2
pkgdesc="Simple interface to Linux process information"
arch=("any")
url="https://github.com/xolox/python-proc"
license=("MIT")
depends=("python" "python-coloredlogs" "python-executor" "python-humanfriendly" "python-property-manager" "python-setuptools")
source=("https://github.com/xolox/python-proc/archive/${pkgver}.tar.gz")
sha512sums=("46a7f97be1af0f1a2b717acfdda2bcea15aebfe6dd04e352b176a42fe0962800ddabd9e6f91d83bf8267370d4098b846576238ebabf3cb78d4ccee0889768817")

package() {
    cd "python-proc-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-proc/LICENSE.txt"
}
