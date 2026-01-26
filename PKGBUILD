# Maintainer: saurify
pkgname=rofi-passx
pkgver=1.0.0
pkgrel=1
pkgdesc="Rofi based password manager based on pass"
arch=('any')
url="https://github.com/saurify/rofi-passx"
license=('MIT')
depends=('bash' 'gnupg' 'pass' 'rofi' 'xclip' 'libnotify')
optdepends=('wl-clipboard: Wayland clipboard support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/saurify/rofi-passx/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-main"
    make install PREFIX=/usr DESTDIR="$pkgdir"
}
