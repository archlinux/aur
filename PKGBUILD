# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail dot com>

pkgname=ugit
pkgver=5.8
pkgrel=1
pkgdesc="ugit helps you undo your last git command with grace. Your damage control git buddy. Undo from 20+ git scenarios."
arch=('any')
url="https://github.com/Bhupesh-V/ugit"
license=('MIT')
depends=('bash' 'awk' 'grep' 'ncurses' 'fzf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('1fef4fc268ab7572d3983317c04a282d30a1e0dd7c8a024cce97a138cc04adf5659bf7be30ff6916ae6d3564f91a4d4e01722522733bd42472777e38e74168b2')

package(){

	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "$pkgname.plugin.zsh" -t "$pkgdir/usr/share/zsh/plugins/$pkgname"

}
