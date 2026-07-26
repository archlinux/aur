# Maintainer: Hatchy <crkklk6@gmail.com>
pkgname=poe-diff
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI item comparison utility for Path of Exile (optimized for Wayland)"
arch=('any')
url="https://github.com/Hatchy-py/poe-diff"
license=('MIT')
depends=('python' 'wl-clipboard')
optdepends=('xclip: clipboard support for X11 sessions')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('75f76a03ddafe1fbf96d9676f4220090ea5c7260e1d935cbd8932c755602f3cd')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 bin/poe-diff "$pkgdir/usr/bin/poe-diff"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
