# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail dot com>

pkgname=ugit
pkgver=1.0
pkgrel=4
pkgdesc="ugit helps you undo your last git command with grace. Your damage control git buddy"
arch=('any')
url="https://github.com/Bhupesh-V/ugit"
license=('MIT')
depends=('bash' 'awk' 'grep' 'ncurses' 'fzf')
options=('!strip' '!emptydirs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v1.0.tar.gz")
sha512sums=('b0aae39ffa2f809b6ec8d0f1aeacd8998faa4df57beee81ea4454bb33468d703dedefed0d2446608cd85c6b67816a058dc8b03e98c4b683052e05c524fe2e5d7')

package(){

	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

}
