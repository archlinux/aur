# Maintainer: Gergan Penkov < gergan at gmail dot email >

_name="tilt"
pkgname="$_name-bin"
pkgver=0.12.10
pkgrel=1
pkgdesc='Local Kubernetes development with no stress'
arch=('x86_64')
url='https://tilt.build/'
license=('Apache')
provides=("$_name")
conflicts=("$_name")
source=("https://github.com/windmilleng/tilt/releases/download/v${pkgver}/${_name}.${pkgver}.linux.x86_64.tar.gz")
sha512sums=('f0158dd1a89a5768609d235808f5df406790913f72d55e610e879bf6f1bb2a707825f86bc2a74037da5c8b6612712558e5810fbdc165607235f8e59d7d0dbd44')

package() {
    install -D -m 0644 README.md "$pkgdir/usr/share/doc/tilt/README.md"
    install -D -m 0755 tilt "$pkgdir/usr/bin/tilt"
}
