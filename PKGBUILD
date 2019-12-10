# Maintainer : tadly <me@tadly.de>

pkgname=parsec-bin
pkgver=150_11
pkgrel=2
pkgdesc='Remotely connect to a gaming pc for a low latency remote computing experience'
url='http://parsec.tv'
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
provides=('parsec')
depends=('gcc-libs' 'libglvnd' 'libxext' 'libxcb')
optdepends=('libva: For hardware accelerated decoding')

source_x86_64=('https://builds.parsecgaming.com/package/parsec-linux.deb')
sha256sums_x86_64=('0741a0b535e676853a50d3ff1a6f6b2355fff127b6a0c0e503ad83818ef7bc74')

source_arm=('https://builds.parsecgaming.com/package/parsec-rpi.deb')
sha256sums_arm=('3b72d1d761f53977fd4be07c7ba049838f3b24f63009b3ed196ca997fa7ea06f')

source_armv6h=($source_arm)
sha256sums_armv6h=($sha256sums_arm)

source_armv7h=($source_arm)
sha256sums_armv7h=($sha256sums_arm)

source_aarch64=($source_arm)
sha256sums_aarch64=($sha256sums_arm)

package() {
    tar xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    chmod 755 "${pkgdir}/usr/"
}
