# Maintainer: mekb https://github.com/mekb-turtle
pkgname=mekfetch-git
pkgver=1.0.0
pkgrel=1
pkgdesc='Simple neofetch alternative written in C'
arch=('any')
url="https://github.com/mekb-turtle/mekfetch"
provides=( mekfetch )
source=("mekfetch::git+${url}.git")
sha256sums=(SKIP)
build() {
	make -C "$srcdir/mekfetch"
}
package() {
	install -Dm755 "$srcdir/mekfetch/mekfetch" "$pkgdir/usr/bin/mekfetch"
}
