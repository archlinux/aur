# Maintainer: Sebastian Kremiec <sebastian.kremiec at gmail dot com>
pkgname=bpmn-js-token-simulation-plugin
pkgver=0.9.0
pkgrel=1
pkgdesc='Token Simulation for the Camunda Modeler'
arch=('any')
url='https://github.com/bpmn-io/bpmn-js-token-simulation-plugin'
license=('MIT')
source=("https://github.com/bpmn-io/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('6098b5f8936b6294195226b303753cf414931e03e7052725f574184f50d77737')
depends=('camunda-modeler')

package() {
    mkdir -p $pkgdir/opt/camunda-modeler/resources/plugins/$pkgname
    cp -a $srcdir/$pkgbase-$pkgver/* $pkgdir/opt/camunda-modeler/resources/plugins/$pkgname
}
