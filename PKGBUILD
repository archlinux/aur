pkgname=gtkcord3-git
_pkgname=gtkcord3
pkgver=indev
pkgrel=2
pkgdesc='Discord client written in go and gtk3'
arch=('any')
url='https://github.com/diamondburned/gtkcord3'
license=('GPL3')
makedepends=('git' 'go')
source=('git+https://github.com/diamondburned/gtkcord3')
sha1sums=('SKIP')

build() {
	cd $_pkgname
	go build
}

package() {
	cd $_pkgname
	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 LICENSE /usr/share/licenses/$_pkgname/LICENSE
}

