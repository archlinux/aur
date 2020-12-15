# Maintainer: Ruben Gees <rubengees7@gmail.com>

pkgname=mqtt-cli-bin
pkgver=4.4.4
pkgrel=1
pkgdesc="MQTT 5.0 and 3.1.1 compatible and feature-rich MQTT Command Line Interface."
arch=('x86_64')
url="https://hivemq.github.io/mqtt-cli"
license=('Apache')
depends=('bash' 'java-runtime>=1.8')
source=('https://github.com/hivemq/mqtt-cli/releases/download/v4.4.4/mqtt-cli-4.4.4.deb')
md5sums=('0df398035f950d12dccdb3baf99caaf2')

package() {
	tar -zxf data.tar.gz -C "${pkgdir}"
}
