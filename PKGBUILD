# Maintainer: Huck Boles <huboles@pm.me>
pkgname=zshmux
pkgver=0.1.2
pkgrel=3
pkgdesc="Provides quick access to tmux when a new shell is opened"
arch=('any')
url="https://download.huck.website"
license=('GPL')
depends=('zsh' 'tmux')
source=("$pkgname-$pkgver.tar.gz::$url/$pkgname-$pkgver.tar.gz")
sha256sums=('3890f340ab20212eee8cd47656abe9396c9f0cd75a62c323c974a89ec26119a3')
package() {
	cd "$srcdir" || exit
	install -CDm755 zshmux.zsh -T "$pkgdir/usr/lib/zshmux/zshmux.zsh"
}
