# Maintainer: thorko contact@thorko.de
pkgname=sensu-cli
pkgver=6.8.1
pkgrel=0
pkgdesc="Sensu Go cli"
arch=('x86_64' 'armv7h')
url='https://sensu.io'
license=('SENSU FREE LICENSE AGREEMENT')
source_armv7h=("${pkgname}-${pkgver}_armv7h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv7.tar.gz")
sha256sums_armv7h=('9acbcbc4821f00d7637b7087b6a047d317e8b134436e33f337a868bb8cb8199c')
source_x86_64=("${pkgname}-${pkgver}_x86_64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('55033250e3b18be1d9c8e76510549d0216901cfdc8a1f4bf63dc81820c174a41')

package() {
    install -Dm755 "${srcdir}/sensuctl" "${pkgdir}/usr/bin/sensuctl"
}
