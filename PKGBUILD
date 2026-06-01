# Maintainer: Dmitry Yarikov <dmitry@yarikov.com>
pkgname=kvn-tui-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Terminal VPN client for Arch Linux + Wayland with vim navigation"
arch=('x86_64')
url="https://github.com/yarikov/kvn-tui"
license=('MIT')
depends=('gcc-libs' 'dbus' 'sing-box')
provides=('kvn-tui')
conflicts=('kvn-tui')
source=("https://github.com/yarikov/kvn-tui/releases/download/v0.5.0/kvn-tui-0.5.0-x86_64-linux.tar.gz")
sha256sums=('541ee24c8d6af8068607fc031a1957cf9c01c728efdeaaa376b0b280aceb7d00')

package() {
    cd "kvn-tui-0.5.0-x86_64-linux"
    install -Dm755 kvn-tui "$pkgdir/usr/bin/kvn-tui"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
