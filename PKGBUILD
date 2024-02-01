pkgname=nyaa
pkgver=0.4.0
pkgrel=2
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A tui tool for browsing and downloading torrents from nyaa.si"
license=('GPL-3.0-or-later')
url='https://github.com/Beastwick18/nyaa/'
provides=("nyaa")

build() {
	return 0
}

package() {
	cd $srcdir
	cargo install --root="$pkgdir" --git="$url" --bin="nyaa" --no-track
}
