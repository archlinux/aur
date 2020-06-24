# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Gergan Penkov < gergan at gmail dot email >

pkgname="tilt-bin"
_pkgname="tilt"
pkgver=0.15.1
pkgrel=1
pkgdesc='Local Kubernetes development with no stress'
arch=('x86_64')
url='https://tilt.build/'
license=('Apache')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://github.com/windmilleng/tilt/releases/download/v${pkgver}/${_pkgname}.${pkgver}.linux.x86_64.tar.gz")
sha512sums=('279f05f8d95a2f3fc75ab3cc2bfb96e8121e034cb12b7b2fb92f076d4dddeef940c6083ae3218a69529607756fcd2606e6f1a3529f50af1614b453535ce045ff')

package() {
    install -D -m 0644 README.md "$pkgdir/usr/share/doc/tilt/README.md"
    install -D -m 0755 tilt "$pkgdir/usr/bin/$_pkgname"
}
