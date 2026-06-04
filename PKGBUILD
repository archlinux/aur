# Maintainer: Dmitry Yarikov <dmitry@yarikov.com>
pkgname=kvn-tui-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="Terminal VPN client for Arch Linux + Wayland with vim navigation"
arch=('x86_64')
url="https://github.com/yarikov/kvn-tui"
license=('MIT')
depends=('gcc-libs' 'dbus' 'sing-box')
provides=('kvn-tui')
conflicts=('kvn-tui')
source=("https://github.com/yarikov/kvn-tui/releases/download/v0.6.2/kvn-tui-0.6.2-x86_64-linux.tar.gz")
sha256sums=('204f0487c76d35c29cb129c1fd6ba9eb47b3a16e8289a68be0d08f75809f9391')

package() {
    cd "kvn-tui-0.6.2-x86_64-linux"
    install -Dm755 kvn-tui "$pkgdir/usr/bin/kvn-tui"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
