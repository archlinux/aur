# Maintainer: Zeffuro <Jeffroiscool@gmail.com>
pkgname=zeff-boy-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A Game Boy, Game Boy Color, and NES emulator written in Rust"
arch=('x86_64')
url="https://github.com/Zeffuro/zeff-boy"
license=('MIT' 'Apache-2.0')
depends=('alsa-lib' 'systemd-libs')
provides=('zeff-boy')
conflicts=('zeff-boy')
source=(
    "zeff-boy-${pkgver}.tar.gz::https://github.com/Zeffuro/zeff-boy/releases/download/v${pkgver}/zeff-boy-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
    "zeff-boy.desktop::https://raw.githubusercontent.com/Zeffuro/zeff-boy/v${pkgver}/packaging/zeff-boy.desktop"
    "LICENSE-MIT::https://raw.githubusercontent.com/Zeffuro/zeff-boy/v${pkgver}/LICENSE-MIT"
    "LICENSE-APACHE::https://raw.githubusercontent.com/Zeffuro/zeff-boy/v${pkgver}/LICENSE-APACHE"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
    install -Dm755 "zeff-boy" "${pkgdir}/usr/bin/zeff-boy"
    install -Dm644 "zeff-boy.desktop" "${pkgdir}/usr/share/applications/zeff-boy.desktop"
    install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}

