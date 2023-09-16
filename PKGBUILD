# Maintainer : Sergio Ribera <sergioalejandroriberacosta@gmail.com>

pkgname=simplemoji
pkgver=0.1.3
pkgrel=1
pkgdesc="Fast Application for look your amazing emojis write in Rust"
arch=('x86_64')
url="https://github.com/SergioRibera/simplemoji"
license=('MIT')
depends=('noto-fonts-emoji' 'noto-fonts')
optdepends=()
makedepends=()
source=("$url/releases/download/v${pkgver}/${pkgname}-x86_64-unknown-linux-gnu.tar.gz")
sha512sums=('SKIP')

package() {
    # install binary
    install -Dm 755 "$srcdir/${pkgname}" "$pkgdir/usr/bin/$pkgname"
    # install license
    # install -Dm 644 LICENSE -t "$pkgdir/licenses/$pkgname"
}
