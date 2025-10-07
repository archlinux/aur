# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Mateusz Gozdek <mgozdekof@gmail.com>
# Contributor: Oden S. <aur@odensc.com>
# Contributor: Gergan Penkov < gergan at gmail dot email >

pkgname="tilt-bin"
_pkgname="tilt"
pkgver=0.35.2
pkgrel=1
pkgdesc='Local Kubernetes development with no stress'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://tilt.dev'
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("https://github.com/tilt-dev/tilt/releases/download/v${pkgver}/${_pkgname}.${pkgver}.linux.${CARCH}.tar.gz")
source_aarch64=("https://github.com/tilt-dev/tilt/releases/download/v${pkgver}/${_pkgname}.${pkgver}.linux.arm64.tar.gz")
source_armv7h=("https://github.com/tilt-dev/tilt/releases/download/v${pkgver}/${_pkgname}.${pkgver}.linux.arm.tar.gz")
sha256sums_x86_64=('29bdd69f9ea0ffd997521008f7a2c1f2bd7c549d02012647fd9671bd69c468b9')
sha256sums_aarch64=('c638547897c618fab6130f3585c1bde475c36724680aa4d0737604fafa116fdd')
sha256sums_armv7h=('e5109adb99efbee658cac3a1c8f5ccb65a273caaed20febecf36b42e5a3d5de4')

package() {
    install -D -m 0644 README.md "$pkgdir/usr/share/doc/tilt/README.md"
    install -D -m 0755 tilt "$pkgdir/usr/bin/$_pkgname"
}
