# Maintainer: Dorian Bourgeoisat <dorian dot bourgeoisat at icloud dot com>
pkgname=ttf-comic-mono-git
pkgver=1
pkgrel=1
pkgdesc="like the famous font but monospace and with adjusted metric"
license=('MIT')
arch=('any')
makedepends=('git')
provides=("comic-mono")

source=("git+https://github.com/dtinth/comic-mono-font.git")
md5sums=('SKIP')

package() {
	cd "$srcdir/comic-mono-font"
	install -d "$pkgdir/usr/share/fonts/TTF"
	install -Dm755 *.ttf "$pkgdir/usr/share/fonts/TTF"
}
