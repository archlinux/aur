# Maintainer: Sascha Pfau <MrPeacock at gmail dot com>
plugin=bpmn-js-token-simulation-plugin
pkgname=camunda-modeler-plugin-bpmn-js-token-simulation
pkgver=0.13.1
pkgrel=1
pkgdesc='Token Simulation for the Camunda Modeler'
arch=('any')
url='https://github.com/bpmn-io/bpmn-js-token-simulation-plugin'
license=('MIT')
source=("https://github.com/bpmn-io/${plugin}/archive/v${pkgver}.tar.gz")
sha256sums=('7d5e986f0a3f422b23061006a2cd1c8384a0d84921bbb4a6c561523f6b70a49e')
depends=('camunda-modeler')

package() {
    mkdir -p $pkgdir/opt/camunda-modeler/resources/plugins/$plugin
    cp -a $srcdir/$plugin-$pkgver/* $pkgdir/opt/camunda-modeler/resources/plugins/$plugin
}
