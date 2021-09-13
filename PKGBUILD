# Maintainer: Ruben Gees <rubengees7@gmail.com>

pkgname=mqtt-cli-bin
pkgver=4.7.0
pkgrel=2
pkgdesc="MQTT 5.0 and 3.1.1 compatible and feature-rich MQTT Command Line Interface."
arch=('x86_64')
url="https://hivemq.github.io/mqtt-cli"
license=('Apache')
depends=('bash' 'java-runtime>=1.8')
source=('https://github.com/hivemq/mqtt-cli/releases/download/v4.7.0/mqtt-cli-4.7.0.deb')
md5sums=('f5b766924ea41644ac1dc168a64288c9')

package() {
	tar -zxf data.tar.gz -C "${pkgdir}"
}
