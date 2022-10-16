# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail dot com>

pkgname=ugit
pkgver=5.4
pkgrel=1
pkgdesc="ugit helps you undo your last git command with grace. Your damage control git buddy"
arch=('any')
url="https://github.com/Bhupesh-V/ugit"
license=('MIT')
depends=('bash' 'awk' 'grep' 'ncurses' 'fzf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('2889d9ed56b16c3e5e7566b669e267d0b58fdbd1f11a0f3ac2f4f9eb5bd3b6756583d8a4ff1c60a5f1c5dbc616583e4baaf0fb311c44b1719db46d5edcaf70dc')

package(){

	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "$pkgname.plugin.zsh" -t "$pkgdir/usr/share/zsh/plugins/$pkgname"

}
