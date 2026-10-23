# Maintainer: Keith Cirkel <keithamus@users.noreply.github.com>
pkgname=riptags-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="Fast tree-sitter symbol search: definitions and cross-references"
arch=('x86_64' 'aarch64')
url="https://github.com/keithamus/riptags"
license=('MIT')
provides=('riptags')
conflicts=('riptags')
source=("riptags-bin-$pkgver-LICENSE::https://raw.githubusercontent.com/keithamus/riptags/v$pkgver/LICENSE")
source_x86_64=("rt-$pkgver-x86_64.tar.gz::https://github.com/keithamus/riptags/releases/download/v$pkgver/rt-linux-x64.tar.gz")
source_aarch64=("rt-$pkgver-aarch64.tar.gz::https://github.com/keithamus/riptags/releases/download/v$pkgver/rt-linux-arm64.tar.gz")
sha256sums=('36d40a511030c0ad186c7d3d5e193618ce49652a09e023c78cc8661e707c5f1e')
sha256sums_x86_64=('3066c854d2a6922a4a6261d39b9b20b1256df740e5dc7b8a67e215aab1cf557a')
sha256sums_aarch64=('d70e3404111fe33ee39de28c3860e44e1b591ee7bd04f8b9c7ee6d4f3aa94b2f')

package() {
  install -Dm755 "rt" "$pkgdir/usr/bin/rt"
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
