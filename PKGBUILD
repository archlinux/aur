# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail dot com>

pkgname=ugit
pkgver=5.9
pkgrel=1
pkgdesc="ugit helps you undo your last git command with grace. Your damage control git buddy. Undo from 20+ git scenarios."
arch=('any')
url="https://github.com/Bhupesh-V/ugit"
license=('MIT')
depends=('bash' 'awk' 'grep' 'ncurses' 'fzf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('4aa05d8e8afa7e52f6c268496db447506dc20383953577013b7b1e173cc98ac13d0195d5c5f7baa80ccbe140de97f63b4063898f8fcdedd72c1f047abd13d98f')

package() {

	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "$pkgname.plugin.zsh" -t "$pkgdir/usr/share/zsh/plugins/$pkgname"

}
