# Maintainer: Carlos Prieto Ortiz <prietus@live.com>
pkgname=irkt-bin
pkgver=0.3.20
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
sha256sums_x86_64=('5c3568781d2df569f4f3c6372f3de4dc294369b10a30bb9e6f550f7739f407c7')
sha256sums_aarch64=('88ac0c4e6b53be8710d236b8d9cd1f025e34055506001dc7256eed29c51e5f8b')

package() {
	install -Dm0755 irkt "$pkgdir/usr/bin/irkt"
	install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
