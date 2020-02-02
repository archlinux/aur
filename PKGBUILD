# Maintainer: Gergan Penkov < gergan at gmail dot email >

_name="tilt"
pkgname="$_name-bin"
pkgver=0.11.4
pkgrel=1
pkgdesc='Local Kubernetes development with no stress'
arch=('x86_64')
url='https://tilt.build/'
license=('Apache')
provides=("$_name")
conflicts=("$_name")
source=("https://github.com/windmilleng/tilt/releases/download/v${pkgver}/${_name}.${pkgver}.linux.x86_64.tar.gz")
sha512sums=('92c4f27635f50f30a567a34908fe444e921a9f266a8db4ff1f1fb060e9d609216216cfc85ded9bea2bf223204931d373af3b46bdbb30766191492b2ae9264fc6')

package() {
    install -D -m 0644 README.md "$pkgdir/usr/share/doc/tilt/README.md"
    install -D -m 0755 tilt "$pkgdir/usr/bin/tilt"
}
