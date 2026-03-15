# Maintainer: stickpro <your@email.com>
pkgname=kyp-gui-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Keep Your Passwords — local-first GUI password manager with TOTP support"
arch=('x86_64')
url="https://github.com/stickpro/kyp"
license=('MIT')
provides=('kyp-gui')
conflicts=('kyp-gui' 'kyp-gui-git')
depends=('webkit2gtk-4.1' 'gtk3')
source_x86_64=("https://github.com/stickpro/kyp/releases/download/v${pkgver}/kyp-gui_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('SKIP')

package() {
    install -Dm755 kyp-gui "${pkgdir}/usr/bin/kyp-gui"
    install -Dm644 kyp-gui.desktop "${pkgdir}/usr/share/applications/kyp-gui.desktop"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}