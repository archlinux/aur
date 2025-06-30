# Maintainer: Ruben Gees <rubengees7@gmail.com>

pkgname=mqtt-cli-bin
pkgver=4.40.0
pkgrel=1
pkgdesc="MQTT 5.0 and 3.1.1 compatible and feature-rich MQTT Command Line Interface."
arch=('x86_64')
url="https://hivemq.github.io/mqtt-cli"
license=('Apache')
depends=('bash' 'java-runtime-headless>=11')
source=('https://github.com/hivemq/mqtt-cli/releases/download/v4.40.0/mqtt-cli-4.40.0.deb')
md5sums=('e90a64738496d2eebcde77ac51315568')

package() {
    tar -zxf data.tar.gz -C "${pkgdir}"
}
