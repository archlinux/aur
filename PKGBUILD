# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail dot com>

pkgname=ugit
pkgver=5.5
pkgrel=1
pkgdesc="ugit helps you undo your last git command with grace. Your damage control git buddy. Undo from 20+ git scenarios."
arch=('any')
url="https://github.com/Bhupesh-V/ugit"
license=('MIT')
depends=('bash' 'awk' 'grep' 'ncurses' 'fzf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('3f2042a6f773b089a83dbdb9f298a43ed028421d0465575e16270b94e44a7c32450602fa0c52854bf9c9b1bce9f61c95fdf71669914d11012b9cdcc93d6d929c')

package(){

	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "$pkgname.plugin.zsh" -t "$pkgdir/usr/share/zsh/plugins/$pkgname"

}
