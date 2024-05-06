# Maintainer: AdriDoesThings <adri@adridoesthings.com>

pkgname="philipshue-cli"
pkgver=0.2.4
pkgrel=1
pkgdesc="A cli interface for the philipshue api"
url="https://github.com/AdriDevelopsThings/philipshue-cli"
arch=('x86_64')
license=('MIT' 'APACHE')
validgpgkeys=('94202C7FD9025BA4C574623981EDEA6080EEE7BF')
source=($pkgname-$pkgver.tar.gz::https://github.com/AdriDevelopsThings/philipshue-cli/releases/download/$pkgver/philipshue-cli_${pkgver}_x86_64-unknown-linux-musl.tar.gz{,.sig})
sha256sums=('8591ec7920af8a4394789ac70c5eef15d2884f1176cfd771e8e06ef33f736fd1' 'SKIP')

package() {
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

	install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
