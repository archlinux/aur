# Maintainer: Zeffuro <Jeffroiscool@gmail.com>
pkgname=zeff-boy-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="A Game Boy, Game Boy Color, and NES emulator written in Rust"
arch=('x86_64')
url="https://github.com/Zeffuro/zeff-boy"
license=('MIT' 'Apache-2.0')
depends=('alsa-lib' 'systemd-libs')
provides=('zeff-boy')
conflicts=('zeff-boy')
source=("zeff-boy-${pkgver}.tar.gz::https://github.com/Zeffuro/zeff-boy/releases/download/v${pkgver}/zeff-boy-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('cb3ecd590546bd713907b71ce33044ca567ec41aa73fc381d8ad078755279e4f')

package() {
    install -Dm755 "zeff-boy" "${pkgdir}/usr/bin/zeff-boy"
    install -Dm644 "zeff-boy.desktop" "${pkgdir}/usr/share/applications/zeff-boy.desktop"
    install -Dm644 "zeff-boy.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/zeff-boy.png"
    install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
