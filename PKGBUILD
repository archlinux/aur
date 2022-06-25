# Maintainer: Chen Jicheng <git@chenjicheng.com>
pkgname=arduino-cli-bin
_pkgname=arduino-cli
pkgver=0.24.0
pkgrel=1
pkgdesc="Arduino command line tool"
arch=('x86_64' 'i686' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/arduino/arduino-cli"
license=('GPL3')
depends=('glibc')
conflicts=('arduino-cli' 'arduino-cli-git' 'arduino-cli-rc')

source_x86_64=("https://github.com/arduino/arduino-cli/releases/download/${pkgver}/arduino-cli_${pkgver}_Linux_64bit.tar.gz")
source_i686=("https://github.com/arduino/arduino-cli/releases/download/${pkgver}/arduino-cli_${pkgver}_Linux_32bit.tar.gz")
source_aarch64=("https://github.com/arduino/arduino-cli/releases/download/${pkgver}/arduino-cli_${pkgver}_Linux_ARM64.tar.gz")
source_armv6h=("https://github.com/arduino/arduino-cli/releases/download/${pkgver}/arduino-cli_${pkgver}_Linux_ARMv6.tar.gz")
source_armv7h=("https://github.com/arduino/arduino-cli/releases/download/${pkgver}/arduino-cli_${pkgver}_Linux_ARMv7.tar.gz")

sha256sums_x86_64=('0244e41f56b70de6a28cb5d4cb064f32857cca3ea0832ab775887b408c7e381d')
sha256sums_i686=('f3b6903dc416b866f6353c26f868d73ab792ad9e8185ec505eb85e0d2f8f07df')
sha256sums_aarch64=('c02fe52429242c4d00b2b8e4569210d818368ee559d6db76e8716c6b68d9f62f')
sha256sums_armv6h=('fa396ddc21d316266db2a877c118ea86c49c64d21b0c29b2faaea7d2ba03c457')
sha256sums_armv7h=('685c0978aaf068885b268b1033fe5d27099620eb72284061767fe9cf143eee70')

package() {
	install -D -m755 "${srcdir}/arduino-cli" "${pkgdir}/usr/bin/arduino-cli"
	install -D -m644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
