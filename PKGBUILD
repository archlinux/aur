# Maintainer: Dmitry Yarikov <dmitry@yarikov.com>
pkgname=kvn-tui-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Terminal VPN client for Arch Linux + Wayland with vim navigation"
arch=('x86_64')
url="https://github.com/yarikov/kvn-tui"
license=('MIT')
depends=('gcc-libs' 'dbus' 'sing-box')
provides=('kvn-tui')
conflicts=('kvn-tui')
source=("https://github.com/yarikov/kvn-tui/releases/download/v0.6.1/kvn-tui-0.6.1-x86_64-linux.tar.gz")
sha256sums=('8e33eda97a4f2acdd98e994385c3a9eb0a4f87b57dd77bd8ed09ab423849c631')

package() {
    cd "kvn-tui-0.6.1-x86_64-linux"
    install -Dm755 kvn-tui "$pkgdir/usr/bin/kvn-tui"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
