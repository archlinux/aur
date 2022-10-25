# Maintainer: Mateusz Gozdek <mgozdekof@gmail.com>
# Contributor: Oden S. <aur@odensc.com>
# Contributor: Gergan Penkov < gergan at gmail dot email >

pkgname="tilt-bin"
_pkgname="tilt"
pkgver=0.30.10
pkgrel=1
pkgdesc='Local Kubernetes development with no stress'
arch=('x86_64')
url='https://tilt.dev'
license=('Apache')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://github.com/tilt-dev/tilt/releases/download/v${pkgver}/${_pkgname}.${pkgver}.linux.x86_64.tar.gz")
sha256sums=('67133d806f900eef0a36665b39b8c9ef7d70eacb0f4876ede3ce627049aaa6cf')

package() {
    install -D -m 0644 README.md "$pkgdir/usr/share/doc/tilt/README.md"
    install -D -m 0755 tilt "$pkgdir/usr/bin/$_pkgname"
}
