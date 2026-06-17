# Maintainer: Dmitry Yarikov <dmitry@yarikov.com>
pkgname=kvn-tui-bin
pkgver=0.13.1
pkgrel=1
pkgdesc="Terminal VPN client for Arch Linux + Wayland with vim navigation"
arch=('x86_64')
url="https://github.com/yarikov/kvn-tui"
license=('MIT')
install=kvn-tui.install
depends=('gcc-libs' 'dbus' 'sing-box')
provides=('kvn-tui')
conflicts=('kvn-tui')
source=("https://github.com/yarikov/kvn-tui/releases/download/v0.13.1/kvn-tui-0.13.1-x86_64-linux.tar.gz")
sha256sums=('913af02bd4b1101beb3020814f66c1e6b166001d63c1cd766aee242910606057')

package() {
    cd "kvn-tui-0.13.1-x86_64-linux"
    install -Dm755 kvn-tui "$pkgdir/usr/bin/kvn-tui"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
