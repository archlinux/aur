# Maintainer: Tommy Jerry Mairo <tjm@member.fsf.org>
pkgname=ghidra-fidb-repo
pkgver=20200530
pkgrel=2
pkgdesc="Ghidra Function ID dataset repository"
arch=("any")
url="https://github.com/threatrack/ghidra-fidb-repo"
license=('MIT')
optdepends=("ghidra")
source=("https://github.com/threatrack/$pkgname/releases/download/$pkgver/$pkgname""_""$pkgver.zip")
sha256sums=("cbaae947dc41edfd16bcb787f0c9bde4b938b31225a4dad0ee9d254f9360799d")

package() {
	mkdir -p "$pkgdir/opt/ghidra/Ghidra/Features/FunctionID/data/"
	cd "$pkgdir/opt/ghidra/Ghidra/Features/FunctionID/data/"
	cp "$srcdir/$pkgname""_""$pkgver.zip" "$pkgdir/opt/ghidra/Ghidra/Features/FunctionID/data/"
}
