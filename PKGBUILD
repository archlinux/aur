# Maintainer: ziuus <noelyt101@gmail.com>
pkgname=settings-tui-bin
pkgver=0.1.23
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
sha256sums=('a8ecca5c831a05e69d864186a65339c6c83b703080ae0fde0a4cbcc5ca167ea1')

package() {
    install -Dm755 "${srcdir}/settings-tui" "${pkgdir}/usr/bin/settings-tui"
}
