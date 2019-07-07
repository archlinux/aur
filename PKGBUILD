# Maintainer: Robin Lange <robin dot langenc at gmail dot com>
# Contributor: Robin Lange <robin dot langenc at gmail dot com>
pkgname=nvidia-force-comp-pipeline
pkgver=1.0
pkgrel=1
pkgdesc="Simple script to enable \"Force Composition Pipeline\" on all monitors connected to an Nvidia card (fixes tearing)."
arch=('any')
url="https://github.com/Askannz/nvidia-force-comp-pipeline"
license=('MIT')
source=("git+https://github.com/Askannz/nvidia-force-comp-pipeline.git#branch=master")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/nvidia-force-comp-pipeline"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 nvidia-force-comp-pipeline.desktop "$pkgdir/etc/xdg/autostart/nvidia-force-comp-pipeline.desktop"
    install -Dm755 nvidia-force-comp-pipeline "$pkgdir/usr/bin/nvidia-force-comp-pipeline"
}
