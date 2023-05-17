# Maintainer: Sebastian Kremiec <sebastian.kremiec at gmail dot com>
pkgname=bpmn-js-token-simulation-plugin
pkgver=0.17.0
pkgrel=1
pkgdesc='Token Simulation for the Camunda Modeler'
arch=('any')
url='https://github.com/bpmn-io/bpmn-js-token-simulation-plugin'
license=('MIT')
source=("https://github.com/bpmn-io/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('393c4a8e09dcdcd16398ef327dea3dda04428f85617fbf47f65f3ec779c2c93e')
depends=('camunda-modeler')

package() {
    mkdir -p $pkgdir/opt/camunda-modeler/resources/plugins/$pkgname
    cp -a $srcdir/camunda-modeler-token-simulation-plugin-$pkgver/* $pkgdir/opt/camunda-modeler/resources/plugins/$pkgname
}
