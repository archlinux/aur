# Maintainer: Pyy0tr <pierre45240@gmail.com>
pkgname=img2term
pkgver=1.0.0
pkgrel=1
pkgdesc="Convert images to terminal art (ASCII or pixel blocks) with automatic background removal"
arch=('any')
url="https://github.com/Pyy0tr/img2term"
license=('MIT')
depends=('imagemagick' 'jp2a' 'chafa')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('85fbafbe551284e5bda7d6c89730c7e85bf3da3480e333edd0c86dd92e9a64cd')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 img2term        "$pkgdir/usr/bin/img2term"
    install -Dm644 LICENSE         "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md       "$pkgdir/usr/share/doc/$pkgname/README.md"
}
