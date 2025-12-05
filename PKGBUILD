# Polokalap - Polokalap@autizm.us

pkgname=faal-bin
pkgver=1.0.4.3
pkgrel=1
pkgdesc="Simple application menu because why not"
arch=('x86_64')
url="https://github.com/Polokalap/FAAL"
license=('MIT')
depends=('gtk3' 'gtk-layer-shell' 'glibc' 'gcc-libs' 'glib2')
source=("https://github.com/Polokalap/FAAL/releases/download/v${pkgver}/FAAL" "https://raw.githubusercontent.com/Polokalap/LICENSE/refs/heads/main/LICENSE")
sha256sums=('487d20ba56b1d970ff08bec7d30c327770a4050c6fb26e8cdf85216f23aab492' 'd96585293c5ebc2dc94a8eae952be12ff22639924a42e4a0ebda4ae0e779301f')

package() {

    install -Dm755 FAAL "$pkgdir/usr/bin/faal"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
