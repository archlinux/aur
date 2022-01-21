# Maintainer: Sascha Pfau <MrPeacock at gmail dot com>
plugin=bpmn-js-token-simulation-plugin
pkgname=camunda-modeler-plugin-bpmn-js-token-simulation
pkgver=0.15.0
pkgrel=1
pkgdesc='Token Simulation for the Camunda Modeler'
arch=('any')
url='https://github.com/bpmn-io/bpmn-js-token-simulation-plugin'
license=('MIT')
source=("https://github.com/bpmn-io/${plugin}/archive/v${pkgver}.tar.gz")
sha256sums=('9697c7af28b6ab620b873d4f57767609b4f3594d01a1e918e9a4cc47040c878e')
depends=('camunda-modeler')

package() {
    mkdir -p $pkgdir/opt/camunda-modeler/resources/plugins/$plugin
    cp -a $srcdir/$plugin-$pkgver/* $pkgdir/opt/camunda-modeler/resources/plugins/$plugin
}
