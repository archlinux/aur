# Maintainer: Kerran MacDonald <kerran.macdonald@gmail.com>
pkgname=niri-ws-label
pkgver=0.2.0
pkgrel=1
pkgdesc="Floating pill labels for niri workspaces"
arch=('any')
url="https://github.com/kerranm/niri-ws-label"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4-layer-shell' 'niri')
optdepends=('rofi: for the interactive prompt command')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 niri-ws-label "$pkgdir/usr/bin/niri-ws-label"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
