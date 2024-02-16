# Maintainer: thorko contact@thorko.de
pkgname=sensu-cli
pkgver=6.11.0
pkgrel=0
pkgdesc="Sensu Go cli"
arch=('x86_64' 'armv7h')
url='https://sensu.io'
license=('SENSU FREE LICENSE AGREEMENT')
source_armv7h=("${pkgname}-${pkgver}_armv7h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv7.tar.gz")
sha256sums_armv7h=('5c9fc2ae3ee40fd75608f0c62d90a0b5c88c9059a8d4c541d17029910cc17e3c')
source_x86_64=("${pkgname}-${pkgver}_x86_64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('4be392edcc75669b919ddb12a26ce3dce03be18fe704e3be7cfe1cf69340b6ba')

package() {
    install -Dm755 "${srcdir}/sensuctl" "${pkgdir}/usr/bin/sensuctl"
}
