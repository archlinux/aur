# Maintainer: Dmitry Yarikov <dmitry@yarikov.com>
pkgname=kvn-tui-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Terminal VPN client for Arch Linux + Wayland with vim navigation"
arch=('x86_64')
url="https://github.com/yarikov/kvn-tui"
license=('MIT')
depends=('gcc-libs' 'dbus' 'sing-box')
provides=('kvn-tui')
conflicts=('kvn-tui')
source=("https://github.com/yarikov/kvn-tui/releases/download/v0.3.0/kvn-tui-0.3.0-x86_64-linux.tar.gz")
sha256sums=('b47386daec6a14e16898a0da7d86fcd01b7149e01d8aeac2c827b39bcb284bb7')

package() {
    cd "kvn-tui-0.3.0-x86_64-linux"
    install -Dm755 kvn-tui "$pkgdir/usr/bin/kvn-tui"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
