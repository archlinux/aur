pkgname=faal
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple application menu because why not"
arch=('x86_64')
url="https://github.com/Polokalap/FAAL"
license=('MIT')
depends=('gtk3' 'gtk-layer-shell' 'glibc' 'gcc-libs' 'glib2')
source=("https://github.com/Polokalap/FAAL/releases/download/v1/FAAL" "https://raw.githubusercontent.com/Polokalap/LICENSE/refs/heads/main/LICENSE")
sha256sums=('d9b8b2c8b727161279a7d81272c90e4b0ca8cdfca33b3eae386f915cf2e6f238' 'd96585293c5ebc2dc94a8eae952be12ff22639924a42e4a0ebda4ae0e779301f')

package() {
    install -Dm755 "$srcdir/FAAL" "$pkgdir/usr/bin/faal"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}