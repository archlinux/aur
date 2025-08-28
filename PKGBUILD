# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Mateusz Gozdek <mgozdekof@gmail.com>
# Contributor: Oden S. <aur@odensc.com>
# Contributor: Gergan Penkov < gergan at gmail dot email >

pkgname="tilt-bin"
_pkgname="tilt"
pkgver=0.35.1
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
sha256sums_x86_64=('065fd7ced548e30e2959f4b46273e987b9a46c5b78cf94da6946b84e7e3b3396')
sha256sums_aarch64=('30a2f921ec47d9022a2efc77e0b6676b1b3e17d3b230b91b7f0fc71207992002')
sha256sums_armv7h=('daf771635b23b425b88ace2c87edae8b5f5e50964cbcdd00437b864a0152d343')

package() {
    install -D -m 0644 README.md "$pkgdir/usr/share/doc/tilt/README.md"
    install -D -m 0755 tilt "$pkgdir/usr/bin/$_pkgname"
}
