# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Mateusz Gozdek <mgozdekof@gmail.com>
# Contributor: Oden S. <aur@odensc.com>
# Contributor: Gergan Penkov < gergan at gmail dot email >

pkgname="tilt-bin"
_pkgname="tilt"
pkgver=0.36.0
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
sha256sums_x86_64=('9ce610083efc76ffa518ec9b001ddb1711b652adce3333f57ffff6be50ad9719')
sha256sums_aarch64=('1fb79ec7609c9d430c29c66d9d1c12c2a58aaf2314bf42d7372105f8ab2eb4ce')
sha256sums_armv7h=('13b2792388651f4f44742554b7cc67f78e0693c2e63814777c1584e0223d89bd')

package() {
    install -D -m 0644 README.md "$pkgdir/usr/share/doc/tilt/README.md"
    install -D -m 0755 tilt "$pkgdir/usr/bin/$_pkgname"
}
