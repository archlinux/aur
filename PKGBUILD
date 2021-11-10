#Made by Matr1x-101
pkgname="cereal-is-a-soup"
pkgver="1.0.0"
pkgrel="1"
depends=("bash")
pkgdesc="Cereal is a soup!"
arch=("any")
url="https://github.com/Matr1x-101/cereal-is-a-soup"
license=("custom")
source=("https://raw.githubusercontent.com/Matr1x-101/cereal-is-a-soup/main/cereal-is-a-soup.bash" "https://raw.githubusercontent.com/Matr1x-101/cereal-is-a-soup/main/LICENSE")
sha512sums=("SKIP" "SKIP")
package(){
	install -Dm755 "$srcdir/cereal-is-a-soup.bash" "$pkgdir/usr/bin/cereal-is-a-soup"
	mkdir -p "$pkgdir/usr/share/licenses/cereal-is-a-soup"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/cereal-is-a-soup/LICENSE"
}

