# Maintainer: Rob Zolkos <rob@zolkos.com>
pkgname=shout
pkgver=1.0.1
pkgrel=1
pkgdesc="Lightweight speech-to-text for Wayland/Hyprland, optimized for AI coding agents"
arch=('any')
url="https://github.com/robzolkos/shout"
license=('MIT')
depends=('whisper.cpp' 'whisper.cpp-model-tiny' 'wtype' 'pipewire' 'libnotify')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 shout "$pkgdir/usr/bin/shout"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
