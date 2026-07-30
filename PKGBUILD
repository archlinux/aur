# Maintainer: MISTER NEGATIVE <misternegative21@gmail.com>

pkgname=matsya-plymouth-theme
pkgver=1.1
pkgrel=1
pkgdesc="MatsyaOS Plymouth boot splash theme"
arch=('any')
url="https://github.com/MatsyaOs/plymouth-theme-matsya"
license=('GPL-3.0-only')
depends=('plymouth')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    THEME_DIR="$pkgdir/usr/share/plymouth/themes/matsya-plymouth"
    mkdir -p "$THEME_DIR"

    install -Dm644 image-*.png "$THEME_DIR/"
    install -Dm644 matsya-plymouth.plymouth "$THEME_DIR/"
    install -Dm644 matsya-plymouth.script "$THEME_DIR/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
