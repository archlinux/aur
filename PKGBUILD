# Maintainer: dim <mlrudasill@gmail.com>
pkgname=midiplusplus-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="High-performance, un-opinionated C++ piano player and MIDI visualizer"
arch=('x86_64')
url="https://github.com/dim-ghub/MIDIPlusPlusLinux"
license=('MIT')
depends=('sdl2' 'alsa-lib')
provides=('midiplusplus')
conflicts=('midiplusplus')
source=("${url}/releases/download/v${pkgver}/MIDIPlusPlus"
        "${url}/raw/v${pkgver}/midiplusplus.desktop"
        "${url}/raw/v${pkgver}/assets/icon.png")
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
    install -Dm755 "${srcdir}/MIDIPlusPlus" "${pkgdir}/usr/bin/MIDIPlusPlus"
    install -Dm644 "${srcdir}/midiplusplus.desktop" "${pkgdir}/usr/share/applications/midiplusplus.desktop"
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/midiplusplus.png"
}
