# Maintainer: kabuspl <jakubs832 at gmail dot com>

pkgname=trayplay-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Instant Replay (DVR) app for KDE using gpu-screen-recorder in the background"
arch=('x86_64')
url="https://github.com/kabuspl/trayplay"
license=('GPL-3.0-only')
provides=("trayplay=${pkgver}")
conflicts=('trayplay')
depends=('gcc-libs' 'glibc' 'gpu-screen-recorder' 'xdg-desktop-portal-impl' 'kirigami' 'ki18n' 'kcoreaddons')
source=("${pkgname}-${pkgver}.pkg.tar.zst::https://github.com/kabuspl/trayplay/releases/download/v${pkgver}/trayplay-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('60f4eea166e9be423ac2f5ce7e127270a45c5d0e850ff0e76ce3b311246a4b2d')

package() {
    tar -xf "${pkgname}-${pkgver}.pkg.tar.zst" -C "${pkgdir}"
    rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}
}
