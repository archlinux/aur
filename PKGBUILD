# Maintainer: Your Name <xnxmbx@gmail.com>
pkgname=r5valkyrie-launcher-bin
pkgver=0.9.57
pkgrel=1
pkgdesc="Game launcher for R5V with mod management and server browser"
arch=('x86_64')
url="https://github.com/r5valkyrie/launcher"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib')
provides=('r5valkyrie-launcher')
conflicts=('r5valkyrie-launcher')
source=("${pkgname%-bin}-${pkgver}.pkg.tar.zst::${url}/releases/download/v${pkgver}/R5Valkyrie.Launcher-${pkgver}-Arch.pkg.tar.zst")
sha256sums=('98f4539d26498c50e60d97bf4ee169fdde48c8202c81d249a2a91b76fce34a21')

package() {
    cp -r "${srcdir}/"* "${pkgdir}/"
}
