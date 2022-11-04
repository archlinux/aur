# Maintainer: Huck Boles <huboles@pm.me>
pkgname=zshmux
pkgver=1.1
pkgrel=3
pkgdesc="Provides quick access to tmux when a new shell is opened"
arch=('any')
url="https://github.com/huboles/zshmux"
license=('GPL')
depends=('zsh' 'tmux')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")

package() {
	cd "$srcdir" || exit
	install -CDm755 zshmux.zsh -T "$pkgdir/usr/lib/zshmux/zshmux.zsh"
}
sha256sums=('f7be0a217233549dfff8bee79742f654884276b4ae5a19dbb0c0dcef3b321b11')
