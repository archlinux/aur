# Maintainer: Zeffuro <Jeffroiscool@gmail.com>
pkgname=zeff-boy-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="A Game Boy, Game Boy Advance, NES, WonderSwan, and Sega 8-bit emulator written in Rust"
arch=('x86_64')
url="https://github.com/Zeffuro/zeff-boy"
license=('MIT' 'Apache-2.0')
depends=('alsa-lib' 'systemd-libs')
provides=('zeff-boy')
conflicts=('zeff-boy')
source=("zeff-boy-${pkgver}.tar.gz::https://github.com/Zeffuro/zeff-boy/releases/download/v${pkgver}/zeff-boy-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('dfc20d02270a4599da231cb599d94daa58f1460999ad0b55efd3e5c136c81133')

package() {
    install -Dm755 "zeff-boy" "${pkgdir}/usr/bin/zeff-boy"
    install -Dm644 "zeff-boy.desktop" "${pkgdir}/usr/share/applications/zeff-boy.desktop"
    install -Dm644 "zeff-boy.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/zeff-boy.png"
    install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
