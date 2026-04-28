# Maintainer: Your Name <xnxmbx@gmail.com>
pkgname=r5valkyrie-launcher-bin
pkgver=0.10.1
pkgrel=1
pkgdesc="Game launcher for R5V with mod management and server browser"
arch=('x86_64')
url="https://github.com/r5valkyrie/launcher"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib')
provides=('r5valkyrie-launcher')
conflicts=('r5valkyrie-launcher')
source=("${pkgname%-bin}-${pkgver}.pkg.tar.zst::${url}/releases/download/v${pkgver}/R5Valkyrie.Launcher-${pkgver}-Arch.pkg.tar.zst")
sha256sums=('9bf81581ca809dc5f86057acf875a51c67247038bccae950b7f6ac5b047c4fbf')

package() {
    cp -r "${srcdir}/"* "${pkgdir}/"
}
