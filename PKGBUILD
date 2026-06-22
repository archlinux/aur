# Maintainer: Carlos Prieto Ortiz <prietus@live.com>
pkgname=irkt-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Modern terminal IRC client: full IRCv3, SASL/CertFP, inline images (Kitty/iTerm2/Sixel)"
arch=('x86_64' 'aarch64')
url="https://github.com/prietus/irkt"
license=('MIT')
depends=('gcc-libs')
provides=('irkt')
conflicts=('irkt' 'irkt-git')
source_x86_64=("irkt-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/irkt-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("irkt-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/irkt-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('440c3102b69428367e2f5f5004a0b9d7dec9ddcf630640dbf477df6753808067')
sha256sums_aarch64=('fd1f4ee70e01795ad37259d2900a91ee9418865485b07bb4d6ede847d9b15425')
package() {
	install -Dm0755 irkt "$pkgdir/usr/bin/irkt"
	install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
