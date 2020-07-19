# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Gergan Penkov < gergan at gmail dot email >

pkgname="tilt-bin"
_pkgname="tilt"
pkgver=0.16.1
pkgrel=1
pkgdesc='Local Kubernetes development with no stress'
arch=('x86_64')
url='https://tilt.dev'
license=('Apache')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://github.com/windmilleng/tilt/releases/download/v${pkgver}/${_pkgname}.${pkgver}.linux.x86_64.tar.gz")
sha512sums=('831ecfb5763c94bb378f329f5de4288bc32b4456d7a3c65de5c1fcd3729c4152b09e948a19fbf6a4ebfc9931bdaf8eba329304f601a3352397d67dc9d49602c8')

package() {
    install -D -m 0644 README.md "$pkgdir/usr/share/doc/tilt/README.md"
    install -D -m 0755 tilt "$pkgdir/usr/bin/$_pkgname"
}
