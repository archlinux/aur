# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail dot com>

pkgname=ugit
pkgver=5.1
pkgrel=1
pkgdesc="ugit helps you undo your last git command with grace. Your damage control git buddy"
arch=('any')
url="https://github.com/Bhupesh-V/ugit"
license=('MIT')
depends=('bash' 'awk' 'grep' 'ncurses' 'fzf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('776fcd993bf33edf777685d8c107e8197c595df33253fbf271913770639c3806b89b84ec9f0581fe4e5755cea9c438aec3f225211737446d55cbf734c0ff2298')

package(){

	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "$pkgname.plugin.zsh" -t "$pkgdir/usr/share/zsh/plugins/$pkgname"

}
