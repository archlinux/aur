# Maintainer: Dmitry Yarikov <dmitry@yarikov.com>
pkgname=kvn-tui-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Terminal VPN client for Arch Linux + Wayland with vim navigation"
arch=('x86_64')
url="https://github.com/yarikov/kvn-tui"
license=('MIT')
depends=('gcc-libs' 'dbus')
optdepends=('sing-box: VPN backend for connections')
provides=('kvn-tui')
conflicts=('kvn-tui')
source=("https://github.com/yarikov/kvn-tui/releases/download/v{{VERSION}}/kvn-tui-{{VERSION}}-x86_64-linux.tar.gz")
sha256sums=('9873c8994efea0dedba499a7690aee94fa948463456f5f0e5b28b82c67efecab')

package() {
    cd "kvn-tui-{{VERSION}}-x86_64-linux"
    install -Dm755 kvn-tui "$pkgdir/usr/bin/kvn-tui"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
