# Maintainer: thorko contact@thorko.de
pkgname=sensu-cli
pkgver=6.9.0
pkgrel=0
pkgdesc="Sensu Go cli"
arch=('x86_64' 'armv7h')
url='https://sensu.io'
license=('SENSU FREE LICENSE AGREEMENT')
source_armv7h=("${pkgname}-${pkgver}_armv7h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv7.tar.gz")
sha256sums_armv7h=('3635db7e6f207c94bdbca7266d4024d01ca84ef5562f3cb3baf23dc3fe835d7d')
source_x86_64=("${pkgname}-${pkgver}_x86_64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('8815405b7c80b470b559b5538526b4f9cf5b4e17f900c4d081d49681a1241bc4')

package() {
    install -Dm755 "${srcdir}/sensuctl" "${pkgdir}/usr/bin/sensuctl"
}
