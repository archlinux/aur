# Maintainer: Your Name <xnxmbx@gmail.com>
pkgname=r5valkyrie-launcher-bin
pkgver=0.9.62
pkgrel=1
pkgdesc="Game launcher for R5V with mod management and server browser"
arch=('x86_64')
url="https://github.com/r5valkyrie/launcher"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib')
provides=('r5valkyrie-launcher')
conflicts=('r5valkyrie-launcher')
source=("${pkgname%-bin}-${pkgver}.pkg.tar.zst::${url}/releases/download/v${pkgver}/R5Valkyrie.Launcher-${pkgver}-Arch.pkg.tar.zst")
sha256sums=('8cf6605d9d542a9aaa90e234d268354013ab1a996c80c7808892ddaf236f0c46')

package() {
    cp -r "${srcdir}/"* "${pkgdir}/"
}
