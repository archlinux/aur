# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail dot com>

pkgname=ugit
pkgver=4.1
pkgrel=1
pkgdesc="ugit helps you undo your last git command with grace. Your damage control git buddy"
arch=('any')
url="https://github.com/Bhupesh-V/ugit"
license=('MIT')
depends=('bash' 'awk' 'grep' 'ncurses' 'fzf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('f9839b4f3f3c0d12978734c865215ac2d27cfec37fffd24cedb0c45b7526089299c0fdc768774a779f7e0379b0a75c31a87aa1271ae6403fcef00783a6b2167e')

package(){

	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "$pkgname.plugin.zsh" -t "$pkgdir/usr/share/zsh/plugins/$pkgname"

}
