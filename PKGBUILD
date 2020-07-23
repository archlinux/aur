# Maintainer: Ruben Gees <rubengees7@gmail.com>

pkgname=mqtt-cli-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="MQTT 5.0 and 3.1.1 compatible and feature-rich MQTT Command Line Interface."
arch=('x86_64')
url="https://hivemq.github.io/mqtt-cli"
license=('Apache')
depends=('bash' 'java-runtime>=1.8')
source=('https://github.com/hivemq/mqtt-cli/releases/download/v1.2.0/mqtt-cli_1.2.0_all.deb')
md5sums=('a3e5f1d08890d010d19ee0d0e5e09a10')

package() {
	tar -zxf data.tar.gz -C "${pkgdir}"
}
