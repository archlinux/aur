# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Oden S. <aur@odensc.com>
# Contributor: Gergan Penkov < gergan at gmail dot email >

pkgname="tilt-bin"
_pkgname="tilt"
pkgver=0.17.1
pkgrel=1
pkgdesc='Local Kubernetes development with no stress'
arch=('x86_64')
url='https://tilt.dev'
license=('Apache')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://github.com/windmilleng/tilt/releases/download/v${pkgver}/${_pkgname}.${pkgver}.linux.x86_64.tar.gz")
sha512sums=('3ed5a2709f0b3cd46b5edd013b370cb5b5a6d9f7bfaf420da3a28d335e5e809338d651b53e04ad5af5cdb7b313482fb89030faed653089c12cf59f2cfa64ef8a')

package() {
    install -D -m 0644 README.md "$pkgdir/usr/share/doc/tilt/README.md"
    install -D -m 0755 tilt "$pkgdir/usr/bin/$_pkgname"
}
