# Maintainer: Gergan Penkov < gergan at gmail dot email >

_name="tilt"
pkgname="$_name-bin"
pkgver=0.7.0
pkgrel=1
pkgdesc='Local Kubernetes development with no stress'
arch=('x86_64')
url='https://tilt.build/'
license=('Apache')
provides=("$_name")
conflicts=("$_name")
source=("https://github.com/windmilleng/tilt/releases/download/v${pkgver}/${_name}.${pkgver}.linux.x86_64.tar.gz")
md5sums=('e85ec7cbc96e5d3ca5c7eb39e204b6be')

package() {
    install -D -m 0644 README.md "$pkgdir/usr/share/doc/tilt/README.md"
    install -D -m 0755 tilt "$pkgdir/usr/bin/tilt"
}
