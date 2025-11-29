# Polokalap - Polokalap@autizm.us

pkgname=faal-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Simple application menu because why not"
arch=('x86_64')
url="https://github.com/Polokalap/FAAL"
license=('MIT')
depends=('gtk3' 'gtk-layer-shell' 'glibc' 'gcc-libs' 'glib2')
source=("https://github.com/Polokalap/FAAL/releases/download/v1.0.2/FAAL" "https://raw.githubusercontent.com/Polokalap/LICENSE/refs/heads/main/LICENSE")
sha256sums=('44cdc382e03b790ee588517788e7d962ed1bb63e0767f13499488a2177ea1a8a' 'd96585293c5ebc2dc94a8eae952be12ff22639924a42e4a0ebda4ae0e779301f')

package() {

    install -Dm755 FAAL "$pkgdir/usr/bin/faal"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
