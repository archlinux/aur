# Maintainer: opale95 <antoinewright95 at gmail dot com>

pkgname=hypertimer-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="A productivity tool to defeat time blindness"
arch=('x86_64')
url="https://codeberg.org/unfa/HyperTimer/"
license=('GPL3')
provides=('hypertimer')
conflicts=('hypertimer-git')
source=("${url}releases/download/${pkgver}/HyperTimer_${pkgver}_Linux.zip")
sha256sums=('0b317b7dbf5e90d71ada4f6d1ecd543b955c485483e0a457f1ff55d4b58137a5')
options=('!strip')

package() {
        cd "$srcdir"
        install -Dm755 HyperTimer.x86_64 "${pkgdir}/usr/bin/hypertimer"
}
