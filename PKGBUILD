# Maintainer: Borber <borber dot drum at gmail dot com>

pkgname=binger-bin
pkgver=0.1.2
pkgrel=1
pkgdesc='Keyboard-driven pointer selection for wlroots Wayland compositors'
arch=('x86_64')
url='https://github.com/borber/binger'
license=('MIT')
depends=('libxkbcommon')
provides=('binger')
conflicts=('binger')
source=("$pkgname-$pkgver.tar.gz::https://github.com/borber/binger/releases/download/v$pkgver/binger-$pkgver-x86_64-unknown-linux-gnu.tar.gz")

sha256sums=('0e7b08160f873aea1dba433ae8f62fd5b38e7921d8728a3bd8839e5fd7a9df3c')

package() {
    install -Dm755 binger "$pkgdir/usr/bin/binger"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    install -Dm644 config.example.toml "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
}
