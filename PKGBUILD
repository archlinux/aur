# Maintainer: Your Name <xnxmbx@gmail.com>
pkgname=r5valkyrie-launcher-bin
pkgver=0.9.55
pkgrel=1
pkgdesc="R5Valkyrie Launcher - A launcher for R5Reloaded"
arch=('x86_64')
url="https://github.com/R5Reloaded-Kaleidoscope/launcher"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib')
provides=('r5valkyrie-launcher')
conflicts=('r5valkyrie-launcher')
source=("${pkgname%-bin}-${pkgver}.pkg.tar.zst::${url}/releases/download/v${pkgver}/R5Valkyrie.Launcher-${pkgver}-Arch.pkg.tar.zst")
sha256sums=('SKIP')

package() {
    cp -r "${srcdir}/"* "${pkgdir}/"
}
