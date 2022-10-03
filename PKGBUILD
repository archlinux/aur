# Maintainer: Huck Boles <huboles@pm.me>
pkgname=zshmux
pkgver=1.0
pkgrel=3
pkgdesc="Provides quick access to tmux sessions whenever a new shell is opened"
arch=('any')
url="https://github.com/huboles/zshmux"
license=('GPL')
depends=('zsh' 'tmux')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")

package() {
	cd "$srcdir" || exit
	install -CDm755 zshmux.zsh -T "$pkgdir/usr/lib/zshmux/zshmux"
}
sha256sums=('7bc6fb7cdbd951dd42fc1edce528bdb78e2b01626ac042fdd9346798385446fa')
