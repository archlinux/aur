# Maintainer: bcoiner <x6ji7ar9 at anonaddy dot me>

pkgname=asusctl-nosystemd-dinit
pkgver=1
pkgrel=1
pkgdesc="Dinit service files for asusctl (with no SystemD)"
arch=('any')
license=('GPL-3.0')
depends=(dinit asusctl-nosystemd)
optdepends=('rog-control-center-nosystemd: Frontend to control asusctl')
source=('asusd')
sha256sums=('da12e54f1845ce9a5cad28036726ed976b84a1f0a0e53d1c2c83fad8e5c7b9b0')

package() {
    install -Dm644 asusd "$pkgdir/etc/dinit.d/asusd"
}

