# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail dot com>

pkgname=ugit
pkgver=1.0
pkgrel=3
pkgdesc="ugit helps you undo your last git command with grace. Your damage control git buddy"
arch=('any')
url="https://github.com/Bhupesh-V/ugit"
license=('MIT')
depends=('bash' 'awk' 'grep' 'ncurses' 'fzf')
options=('!strip' '!emptydirs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v1.0.tar.gz")
sha512sums=('c8eda62827138f6cd4be4a975cafb5cbd9d306db22cf6d19dc5ef5ae45adbb91100b14d218e53e57769c6b4f6f2bf90470dbe1438f65aac44fec602ece99b465')

package(){

	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

}
