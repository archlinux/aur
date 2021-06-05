# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail dot com>

pkgname=ugit
pkgver=3.0
pkgrel=1
pkgdesc="ugit helps you undo your last git command with grace. Your damage control git buddy"
arch=('any')
url="https://github.com/Bhupesh-V/ugit"
license=('MIT')
depends=('bash' 'awk' 'grep' 'ncurses' 'fzf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('39033264078804c3e92805042a59785bfffe4cec6af156850ff8f9ed4b6cd68b428057d490b813d7b5b6634507eab98a70981d536d87af94a294481754e528f3')

package(){

	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "$pkgname.plugin.zsh" -t "$pkgdir/usr/share/zsh/plugins/$pkgname"

}
