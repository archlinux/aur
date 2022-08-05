# Maintainer: ArtFox3  <artfox3@gmail.com>
pkgname="lobster"
pkgver=1.0.2
pkgrel=1
pkgdesc="Shell script to watch Movies/Webseries/Shows from the terminal."
arch=('any')
url="https://github.com/justchokingaround/lobster.git"
license=('GPL2')
makedepends=('git')
depends=('fzf' 'curl' 'grep' 'sed' 'mpv')
source=("$pkgname::git+$url")
md5sums=('SKIP')

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 "./lobster.sh" "$pkgdir/usr/bin/lobster"
}
