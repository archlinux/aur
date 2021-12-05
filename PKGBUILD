# Maintainer: Sascha Pfau <MrPeacock at gmail dot com>
plugin=tooltip
pkgname=camunda-modeler-plugin-$plugin
pkgver=0.0.8
pkgrel=1
pkgdesc='This plugin adds tooltips to various BPMN-elements revealing some properties and conditional flows'
arch=('any')
url='https://github.com/viadee/camunda-modeler-tooltip-plugin'
license=('MIT')
source=("https://github.com/viadee/camunda-modeler-tooltip-plugin/archive/v${pkgver}.tar.gz")
sha256sums=('83eea45e7727ab4f8d6f7f7cd5d55c864763321e114f412489e621a84c6e9a6e')
depends=('camunda-modeler')

package() {
    mkdir -p $pkgdir/opt/camunda-modeler/resources/plugins/$plugin
    cp -a $srcdir/camunda-modeler-$plugin-plugin-$pkgver/* $pkgdir/opt/camunda-modeler/resources/plugins/$plugin
}
