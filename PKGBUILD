# Maintainer: Chen Jicheng <git@chenjicheng.com>
pkgname=arduino-cli-bin
pkgver=0.22.0
pkgrel=1
pkgdesc="Arduino command line tool"
arch=('x86_64')
url="https://github.com/arduino/arduino-cli"
license=('GPL3')
conflicts=('arduino-cli' 'arduino-cli-git' 'arduino-cli-rc')
source_x86_64=("https://github.com/arduino/arduino-cli/releases/download/${pkgver}/arduino-cli_${pkgver}_Linux_64bit.tar.gz")
sha256sums_x86_64=('45ae384886f25797c7a77cd30f2c2170e110fc36f9817353985d4f77db888a7a')

package() {
	install -Dm755 "${srcdir}/arduino-cli" "${pkgdir}/usr/bin/arduino-cli"
}
