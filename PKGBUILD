# Maintainer: Dmitry Yarikov <dmitry@yarikov.com>
pkgname=kvn-tui-bin
pkgver=0.1.4
pkgrel=2
pkgdesc="Terminal VPN client for Arch Linux + Wayland with vim navigation"
arch=('x86_64')
url="https://github.com/yarikov/kvn-tui"
license=('MIT')
depends=('gcc-libs' 'dbus' 'sing-box')
provides=('kvn-tui')
conflicts=('kvn-tui')
options=('!debug')
source=("https://github.com/yarikov/kvn-tui/releases/download/v${pkgver}/kvn-tui-${pkgver}-x86_64-linux.tar.gz")
sha256sums=('793cda0c64b48e2c868a555abdcc58e4aabacec5040ddef39a5a3c26aab97793')

package() {
    cd "kvn-tui-${pkgver}-x86_64-linux"
    install -Dm755 kvn-tui "$pkgdir/usr/bin/kvn-tui"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
