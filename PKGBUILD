# Maintainer: ziuus <noelyt101@gmail.com>
pkgname=settings-tui-bin
pkgver=0.1.16
pkgrel=1
pkgdesc="A hyper-lightweight (<9MB, near 0% CPU) universal Linux Settings Center for your terminal"
arch=('x86_64')
url="https://github.com/ziuus/settings-tui"
license=('MIT')
depends=()
provides=('settings-tui')
conflicts=('settings-tui')
install=settings-tui-bin.install
source=("https://github.com/ziuus/settings-tui/releases/download/v${pkgver}/settings-tui-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('f9b819c59f67c3f5693a55744e38ef725c3fc6db6e8bd4f853e09180906e4ad6')

package() {
    install -Dm755 "${srcdir}/settings-tui" "${pkgdir}/usr/bin/settings-tui"
}
