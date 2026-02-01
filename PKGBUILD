# Maintainer: Crow Marx
_pkgname=tagcli
pkgname="$_pkgname-git"
pkgver=1.0
pkgrel=1
pkgdesc="Edit Music Metatada with your favourite text editor"
arch=(any)
url="https://gitlab.com/AderynCrow/tagcli"
makedepends=('go')
source=("git+$url.git")
sha256sums=('SKIP')

build() {
	cd $_pkgname
	go build .
}

package() {
	cd $_pkgname
	install -Dm755 "tagcli" "$pkgdir/usr/bin/tagcli"
}
