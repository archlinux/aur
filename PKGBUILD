# Maintainer: Humble Penguin <humblepenguinn@gmail.com>

pkgname=envio-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="A Modern And Secure CLI Tool For Managing Environment Variables"
url="https://envio-cli.github.io/home"
license=("MIT/Apache-2.0")
arch=("x86_64")
provides=("envio")
conflicts=("envio")
source=("https://github.com/envio-cli/envio/releases/download/v$pkgver/envio-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=(SKIP)

package() {
    install -Dm755 "$srcdir/envio-v$pkgver-x86_64-unknown-linux-gnu/envio" -t "$pkgdir/usr/bin"
    install -Dm644 "$srcdir/envio-v$pkgver-x86_64-unknown-linux-gnu/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 "$srcdir/envio-v$pkgver-x86_64-unknown-linux-gnu/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
