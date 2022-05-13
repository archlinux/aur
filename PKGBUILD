# Maintainer: Chen Jicheng <git@chenjicheng.com>
pkgname=arduino-cli-bin
pkgver=0.22.0
pkgrel=2
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

sha256sums_x86_64=('45ae384886f25797c7a77cd30f2c2170e110fc36f9817353985d4f77db888a7a')
sha256sums_i686=('da7a31d6aff1ab190507fae91bacf9e2a389bd3d92c5b826c73fbbdc3fb5b9a1')
sha256sums_aarch64=('e194bbbc4694d2c38e94b928cb8feea16b996860963d98decee5872cc08179ca')
sha256sums_armv6h=('3fc2a68d04deb6d2f0b64a7e79ba4737b6b9f340f7ecc91207176a2c244faecf')
sha256sums_armv7h=('10b6f038eef5de156fef3970fdfe7d423838e5fb4578d0934148cd6b18ccea2e')

package() {
	install -Dm755 "${srcdir}/arduino-cli" "${pkgdir}/usr/bin/arduino-cli"
}
