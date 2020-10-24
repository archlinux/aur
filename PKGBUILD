# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-bin
pkgver=nightly.2020.10.24
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
conflicts=(ruffle-git)
source=("https://github.com/ruffle-rs/ruffle/releases/download/${pkgver//./-}/ruffle_${pkgver//./_}_linux.tar.gz")
sha512sums=('e57c3814ebb4089be2b2c0e374e970cc13a2e7dbdcdff300b3affa476921fef5efae9ca65c2c08d4f53440dd4b017bb996aca247ad4e3de7a808e1d29f8bb508')

package() {
	install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/ruffle"
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" "$srcdir/README.md"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/LICENSE_"*
}
