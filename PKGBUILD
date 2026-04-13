# Maintainer: Mario Stabile <mariostabile1@gmail.com>
pkgname=zidle-git
pkgver=r19.e39f912
pkgrel=1
epoch=
pkgdesc="A multi-scene, zero-dependency Zsh terminal screensaver built with Python curses"
arch=('any')
url="https://github.com/mariostabile1/zidle"
license=('MIT')
groups=()
depends=('zsh' 'python')
makedepends=('git')
checkdepends=()
optdepends=()
provides=('zidle')
conflicts=('zidle')
replaces=()
backup=()
options=()
install='zidle.install'
changelog=
source=("git+https://github.com/mariostabile1/zidle.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/zidle"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/zidle"
}

build() {
	cd "$srcdir/zidle"
}

check() {
	cd "$srcdir/zidle"
}

package() {
	cd "$srcdir/zidle"
	# Installs sources in the standard arch root directory (/usr/share/zidle)
	install -d "$pkgdir/usr/share/zidle"
	cp -r core config scenes zsh zidle.plugin.zsh "$pkgdir/usr/share/zidle/"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/zidle/LICENSE"
}
