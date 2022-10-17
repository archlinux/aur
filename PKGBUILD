# Maintainer: thorko contact@thorko.de
pkgname=sensu-cli
pkgver=6.8.2
pkgrel=0
pkgdesc="Sensu Go cli"
arch=('x86_64' 'armv7h')
url='https://sensu.io'
license=('SENSU FREE LICENSE AGREEMENT')
source_armv7h=("${pkgname}-${pkgver}_armv7h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv7.tar.gz")
sha256sums_armv7h=('7b66ee962983e947c7e64262e908cecfce9df71d7294489c6b5e53e82cf0bb6a')
source_x86_64=("${pkgname}-${pkgver}_x86_64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('9bee5669ac0721c4e6cc597173e8c157289740ae88a3113d01c8851dc39b8163')

package() {
    install -Dm755 "${srcdir}/sensuctl" "${pkgdir}/usr/bin/sensuctl"
}
