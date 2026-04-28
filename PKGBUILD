# Maintainer: Your Name <xnxmbx@gmail.com>
pkgname=r5valkyrie-launcher-bin
pkgver=0.10.2
pkgrel=1
pkgdesc="Game launcher for R5V with mod management and server browser"
arch=('x86_64')
url="https://github.com/r5valkyrie/launcher"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib')
provides=('r5valkyrie-launcher')
conflicts=('r5valkyrie-launcher')
source=("${pkgname%-bin}-${pkgver}.pkg.tar.zst::${url}/releases/download/v${pkgver}/R5Valkyrie.Launcher-${pkgver}-Arch.pkg.tar.zst")
sha256sums=('06a94f38f673a0b571c8ba1f7c73c12dee3410fc5f42c57d8c1be30682dbf87f')

package() {
    cp -r "${srcdir}/"* "${pkgdir}/"
}
