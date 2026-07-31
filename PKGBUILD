# Maintainer: dim <mlrudasill@gmail.com>
pkgname=midiplusplus-bin
pkgver=1.0.1
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
sha256sums=('515e620456c8982a4514cfc49bd426576afc48f00b2904a186e820669d076aeb'
            '9911c426d4c0e83e271d2ed8e32d7b6fc0f4d729346b78d5fb981e9cc1e696e8'
            '7f75d939ed06fd2efdb949a1f1ba80265eb0a7ace45fc856cb5570efaa8265a1')

package() {
    install -Dm755 "${srcdir}/MIDIPlusPlus" "${pkgdir}/usr/bin/MIDIPlusPlus"
    install -Dm644 "${srcdir}/midiplusplus.desktop" "${pkgdir}/usr/share/applications/midiplusplus.desktop"
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/midiplusplus.png"
}
