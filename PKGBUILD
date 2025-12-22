# Maintainer: Your Name <xnxmbx@gmail.com>
pkgname=r5valkyrie-launcher-bin
pkgver=0.9.65
pkgrel=1
pkgdesc="Game launcher for R5V with mod management and server browser"
arch=('x86_64')
url="https://github.com/r5valkyrie/launcher"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib')
provides=('r5valkyrie-launcher')
conflicts=('r5valkyrie-launcher')
source=("${pkgname%-bin}-${pkgver}.pkg.tar.zst::${url}/releases/download/v${pkgver}/R5Valkyrie.Launcher-${pkgver}-Arch.pkg.tar.zst")
sha256sums=('639c2999c5cbf947266d2dc51373a153f87cc7f5c44b05bebc743526dd47fddd')

package() {
    cp -r "${srcdir}/"* "${pkgdir}/"
}
