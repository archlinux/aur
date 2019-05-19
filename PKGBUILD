# Maintainer: Gergan Penkov < gergan at gmail dot email >

_name="tilt"
pkgname="$_name-bin"
pkgver=0.8.5
pkgrel=1
pkgdesc='Local Kubernetes development with no stress'
arch=('x86_64')
url='https://tilt.build/'
license=('Apache')
provides=("$_name")
conflicts=("$_name")
source=("https://github.com/windmilleng/tilt/releases/download/v${pkgver}/${_name}.${pkgver}.linux.x86_64.tar.gz")
md5sums=('057e5ab4ad0a3cefffc9496fb427ef11')

package() {
    install -D -m 0644 README.md "$pkgdir/usr/share/doc/tilt/README.md"
    install -D -m 0755 tilt "$pkgdir/usr/bin/tilt"
}
