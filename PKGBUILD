# Maintainer: Carlos Prieto Ortiz <prietus@live.com>
pkgname=irkt-bin
pkgver=0.3.5
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
sha256sums_x86_64=('a47dc32501e5f885119a94fefdcbd9848928f44f6065e379e9d461edd07950d9')
sha256sums_aarch64=('5f9fc789260217917607167cb4942d004b3c1bb064a166918a0699e039292b3e')
package() {
	install -Dm0755 irkt "$pkgdir/usr/bin/irkt"
	install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
