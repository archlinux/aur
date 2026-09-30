pkgname=kyp-gui-bin
pkgver=0.2.4
pkgrel=1
pkgdesc="Keep Your Passwords — local-first GUI password manager"
arch=('x86_64')
url="https://github.com/stickpro/kyp"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('kyp-gui')
conflicts=('kyp-gui' 'kyp-gui-git')
source=("kyp-gui_${pkgver}_linux_amd64.tar.gz::https://github.com/stickpro/kyp/releases/download/v${pkgver}/kyp-gui_${pkgver}_linux_amd64.tar.gz")
sha256sums=('5f42bba73e1835bf1f98a8c8fc8854569ebde18165a5f59f0c68b42ad09a953a')

package() {
  install -Dm755 kyp-gui "${pkgdir}/usr/bin/kyp-gui"
  install -Dm644 kyp-gui.desktop "${pkgdir}/usr/share/applications/kyp-gui.desktop"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
