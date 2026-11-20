# Maintainer: Borber <borber dot drum at gmail dot com>

pkgname=binger-bin
pkgver=0.1.3
pkgrel=1
pkgdesc='Keyboard-driven pointer selection for wlroots Wayland compositors'
arch=('x86_64')
url='https://github.com/borber/binger'
license=('MIT')
depends=('libxkbcommon')
provides=('binger')
conflicts=('binger')
source=("$pkgname-$pkgver.tar.gz::https://github.com/borber/binger/releases/download/v$pkgver/binger-$pkgver-x86_64-unknown-linux-gnu.tar.gz")

sha256sums=('814c3d99889ba23eda6719a11c4eab6803127d0dc103aa25ef7c244231378b60')

package() {
    install -Dm755 binger "$pkgdir/usr/bin/binger"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    install -Dm644 config.example.toml "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
}
