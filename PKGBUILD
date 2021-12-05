# Maintainer: Sascha Pfau <MrPeacock at gmail dot com>
plugin=linter
pkgname=camunda-modeler-plugin-$plugin
pkgver=0.6.0
pkgrel=1
pkgdesc='Integrates bpmnlint into the Camunda Modeler'
arch=('any')
url='https://github.com/camunda/camunda-modeler-linter-plugin'
license=('MIT')
source=("https://github.com/camunda/camunda-modeler-linter-plugin/archive/v${pkgver}.tar.gz")
sha256sums=('808328ce9957a198c342458bb164b5406b376faa820575e22aeec40ce6418555')
depends=('camunda-modeler')

package() {
    mkdir -p $pkgdir/opt/camunda-modeler/resources/plugins/$plugin
    cp -a $srcdir/camunda-modeler-§plugin-plugin-$pkgver/* $pkgdir/opt/camunda-modeler/resources/plugins/$plugin
}
