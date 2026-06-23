# Maintainer: Carlos Prieto Ortiz <prietus@live.com>
pkgname=irkt-bin
pkgver=0.1.9
pkgrel=1
pkgdesc="Modern terminal IRC client: full IRCv3, SASL/CertFP, inline images (Kitty/iTerm2/Sixel)"
arch=('x86_64' 'aarch64')
url="https://github.com/prietus/irkt"
license=('MIT')
depends=('gcc-libs')
optdepends=(
  'hunspell-en_us: English autocomplete (ghost text)'
  'hunspell-es_es: Spanish autocomplete (ghost text)'
)
provides=('irkt')
conflicts=('irkt' 'irkt-git')
source_x86_64=("irkt-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/irkt-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("irkt-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/irkt-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('dff60e3d10220f74b5a82b3b0d69216328a122fce2c176751e1a6f8941472a21')
sha256sums_aarch64=('5878a0c08691efb106a68f4c46d75427e9cb992f237f424719a762254e48f52c')
package() {
	install -Dm0755 irkt "$pkgdir/usr/bin/irkt"
	install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
