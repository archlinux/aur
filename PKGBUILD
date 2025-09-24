pkgname=rustmius-bin
pkgver=1.3.3
pkgrel=1
pkgdesc="Full local Termius alternative for Linux"
arch=('x86_64')
url="https://github.com/Cleboost/Rustmius"
license=('MIT')
depends=('libadwaita' 'gtk4')
source=(
    "rustmius-$pkgver::$url/releases/download/v$pkgver/rustmius"
    "rustmius.desktop::$url/raw/v$pkgver/rustmius.desktop"
    "rustmius.png::$url/raw/v$pkgver/rustmius.png"
    "README.md::$url/raw/v$pkgver/README.md"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')


package() {
    install -Dm755 "rustmius-$pkgver" "$pkgdir/usr/bin/rustmius"
    install -Dm644 rustmius.desktop "$pkgdir/usr/share/applications/rustmius.desktop"
    install -Dm644 rustmius.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/rustmius.png"
    install -Dm644 README.md "$pkgdir/usr/share/doc/rustmius/README.md"
}
