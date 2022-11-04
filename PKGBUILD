# Maintainer: Huck Boles <huboles@pm.me>
pkgname=zshmux
pkgver=1.1
pkgrel=1
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
sha256sums=('290d84e48ea56b864acd9429be9202aaf87458ebaf4fd4937f1a741c42f71b77')
