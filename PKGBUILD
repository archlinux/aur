# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Mateusz Gozdek <mgozdekof@gmail.com>
# Contributor: Oden S. <aur@odensc.com>
# Contributor: Gergan Penkov < gergan at gmail dot email >

pkgname="tilt-bin"
_pkgname="tilt"
pkgver=0.34.1
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
sha256sums_x86_64=('7ac3b6945d6fa3ec120afa5d9e7016911fc76a63b3d3a703662cacc98dab4a09')
sha256sums_aarch64=('7b0f58a466e3b278167db1d7445d1ca106404675a73cd8cfeac876ac955e17d7')
sha256sums_armv7h=('590becb6df9a5f88bc7a9665208f39b2ed75d685c2b3e422e7b1caadbdf12a83')

package() {
    install -D -m 0644 README.md "$pkgdir/usr/share/doc/tilt/README.md"
    install -D -m 0755 tilt "$pkgdir/usr/bin/$_pkgname"
}
