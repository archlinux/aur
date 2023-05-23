# Maintainer: Tommy Jerry Mairo <tjm@member.fsf.org>
pkgname=ghidra-fidb-repo
pkgver=20200530
pkgrel=1
pkgdesc="Ghidra Function ID dataset repository"
arch=("any")
url="https://github.com/threatrack/ghidra-fidb-repo"
license=('MIT')
optdepends=("ghidra")
source=("https://github.com/threatrack/$pkgname/releases/download/$pkgver/$pkgname""_""$pkgver.zip")
sha256sums=("fa8987b329232de6d03fc79d85cd2ab48933ca791e73b582ca041f6567ff2932")

package() {
	mkdir -p "$pkgdir/opt/ghidra/Ghidra/Features/FunctionID/data/"
	cd "$pkgdir/opt/ghidra/Ghidra/Features/FunctionID/data/"
	cp "$srcdir/$pkgname""_""$pkgver.zip" "$pkgdir/opt/ghidra/Ghidra/Features/FunctionID/data/"
}
