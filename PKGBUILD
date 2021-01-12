# Maintainer: Sebastian Kremiec <sebastian.kremiec at gmail dot com>
pkgname=bpmn-js-token-simulation-plugin
pkgver=0.11.0
pkgrel=1
pkgdesc='Token Simulation for the Camunda Modeler'
arch=('any')
url='https://github.com/bpmn-io/bpmn-js-token-simulation-plugin'
license=('MIT')
source=("https://github.com/bpmn-io/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('30c69a368dc4573c91799ae7f7012be379dff65535c55319937e221bc8d5af06')
depends=('camunda-modeler')

package() {
    mkdir -p $pkgdir/opt/camunda-modeler/resources/plugins/$pkgname
    cp -a $srcdir/$pkgbase-$pkgver/* $pkgdir/opt/camunda-modeler/resources/plugins/$pkgname
}
