# Maintainer: Karim Abou Zeid <karim23697 at gmail dot tld>

pkgname=nonicons-git
pkgver=r51.6e4984b
pkgrel=1
pkgdesc="A next-generation icon set for developers that extends octicons."
arch=(any)
url="https://github.com/yamatsum/nonicons"
license=('unknown')
makedepends=('git')
source=('git+https://github.com/yamatsum/nonicons.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/nonicons"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/nonicons"
	install -Dm644 "dist/nonicons.ttf" -t "$pkgdir/usr/share/fonts/nonicons" 
}
