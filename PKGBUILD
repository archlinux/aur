# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Mateusz Gozdek <mgozdekof@gmail.com>
# Contributor: Oden S. <aur@odensc.com>
# Contributor: Gergan Penkov < gergan at gmail dot email >

pkgname="tilt-bin"
_pkgname="tilt"
pkgver=0.33.20
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
sha256sums_x86_64=('8cd81faa56eb7ff5c96ca7e349f335daca7599b8f1451a6e896a12baa25882ca')
sha256sums_aarch64=('33c350c56bcfbe290d3f29f751bc07600b6daac2eff8bb5928f0635834b60831')
sha256sums_armv7h=('0f2279c15f1f412f1056bd81b7284a3ccc2ac4de356299957f8c1bbcecd66b52')

package() {
    install -D -m 0644 README.md "$pkgdir/usr/share/doc/tilt/README.md"
    install -D -m 0755 tilt "$pkgdir/usr/bin/$_pkgname"
}
