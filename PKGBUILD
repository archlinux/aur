# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail dot com>

pkgname=ugit
pkgver=5.0
pkgrel=1
pkgdesc="ugit helps you undo your last git command with grace. Your damage control git buddy"
arch=('any')
url="https://github.com/Bhupesh-V/ugit"
license=('MIT')
depends=('bash' 'awk' 'grep' 'ncurses' 'fzf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('3d723229511df7581212cd4742f641bbb4b38b724e0f3eec231cf5741e5912c5a70e68ac9759f24a4065f4c4ac4bc6b0a7642fb3cc75970089603aeb657da064')

package(){

	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "$pkgname.plugin.zsh" -t "$pkgdir/usr/share/zsh/plugins/$pkgname"

}
