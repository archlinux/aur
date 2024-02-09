# Maintainer: Sebastian Kremiec <sebastian.kremiec at gmail dot com>
pkgname=camunda-modeler-token-simulation-plugin
pkgver=0.20.0
pkgrel=1
pkgdesc='Camunda Modeler Token Simulation Plug-in'
arch=('any')
url='https://github.com/camunda/camunda-modeler-token-simulation-plugin'
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('870fe039bcb4a1e5258a1d5860507ad8a0a0b762de1d429356de4cb880ab75be')
depends=('camunda-modeler')

package() {
    mkdir -p $pkgdir/opt/camunda-modeler/resources/plugins/$pkgname
    cp -a $srcdir/camunda-modeler-token-simulation-plugin-$pkgver/* $pkgdir/opt/camunda-modeler/resources/plugins/$pkgname
}
