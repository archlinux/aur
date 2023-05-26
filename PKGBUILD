# Maintainer: thorko contact@thorko.de
pkgname=sensu-cli
pkgver=6.10.0
pkgrel=0
pkgdesc="Sensu Go cli"
arch=('x86_64' 'armv7h')
url='https://sensu.io'
license=('SENSU FREE LICENSE AGREEMENT')
source_armv7h=("${pkgname}-${pkgver}_armv7h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv7.tar.gz")
sha256sums_armv7h=('a7be4ecbfd8c9c9dafc2f8a7f9840fde12362ea83cc02ca4556e99498a04b45c')
source_x86_64=("${pkgname}-${pkgver}_x86_64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('bdf866b3558b77ed6b764f6b52148fba89290cc0393f451ade03d255ff0dc429')

package() {
    install -Dm755 "${srcdir}/sensuctl" "${pkgdir}/usr/bin/sensuctl"
}
