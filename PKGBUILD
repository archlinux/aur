# Maintainer: ziuus <noelyt101@gmail.com>
pkgname=settings-tui-bin
pkgver=0.1.15
pkgrel=1
pkgdesc="A hyper-lightweight (<9MB, near 0% CPU) universal Linux Settings Center for your terminal"
arch=('x86_64')
url="https://github.com/ziuus/settings-tui"
license=('MIT')
depends=()
provides=('settings-tui')
conflicts=('settings-tui')
source=("https://github.com/ziuus/settings-tui/releases/download/v${pkgver}/settings-tui-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('2332e9102778a822faa51d2b0cd962e22818ccdd5828f4c512092991ba690109')

package() {
    install -Dm755 "${srcdir}/settings-tui" "${pkgdir}/usr/bin/settings-tui"
}
