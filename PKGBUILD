# Maintainer: kabuspl <jakubs832 at gmail dot com>

pkgname=trayplay-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Instant Replay (DVR) app for KDE using gpu-screen-recorder in the background"
arch=('x86_64')
url="https://github.com/kabuspl/trayplay"
license=('GPL-3.0-only')
provides=("trayplay=${pkgver}")
conflicts=('trayplay')
depends=('gcc-libs' 'glibc' 'gpu-screen-recorder' 'xdg-desktop-portal-impl' 'kdialog' 'kirigami')
source=("${pkgname}-${pkgver}.pkg.tar.zst::https://github.com/kabuspl/trayplay/releases/download/v${pkgver}/trayplay-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('8edcde3776d1114de6d205ad03801479e89fa83923c8414a27e5122a6e0b079b')

package() {
    tar -xf "${pkgname}-${pkgver}.pkg.tar.zst" -C "${pkgdir}"
    rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}
}
