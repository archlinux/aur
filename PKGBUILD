# Maintainer: Zeffuro <Jeffroiscool@gmail.com>
pkgname=zeff-boy-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="A Game Boy, Game Boy Color, and NES emulator written in Rust"
arch=('x86_64')
url="https://github.com/Zeffuro/zeff-boy"
license=('MIT' 'Apache-2.0')
depends=('alsa-lib' 'systemd-libs')
provides=('zeff-boy')
conflicts=('zeff-boy')
source=("zeff-boy-${pkgver}.tar.gz::https://github.com/Zeffuro/zeff-boy/releases/download/v${pkgver}/zeff-boy-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('86b89ecf84c0a653e338e75fe48c1bfc5ae58292255b3f2e9aebc070c91dd4db')

package() {
    install -Dm755 "zeff-boy" "${pkgdir}/usr/bin/zeff-boy"
    install -Dm644 "zeff-boy.desktop" "${pkgdir}/usr/share/applications/zeff-boy.desktop"
    install -Dm644 "zeff-boy.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/zeff-boy.png"
    install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
