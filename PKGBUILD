# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail dot com>

pkgname=ugit
pkgver=5.6
pkgrel=1
pkgdesc="ugit helps you undo your last git command with grace. Your damage control git buddy. Undo from 20+ git scenarios."
arch=('any')
url="https://github.com/Bhupesh-V/ugit"
license=('MIT')
depends=('bash' 'awk' 'grep' 'ncurses' 'fzf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('37b32b64ce75e763249222c1dd1dd2840f516cf04bde9d53e1bb37901a94c93c5ac0a4b49fa9f50fee9decedbf629d35957108a0d342c8dafda393965a839dfa')

package(){

	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "$pkgname.plugin.zsh" -t "$pkgdir/usr/share/zsh/plugins/$pkgname"

}
