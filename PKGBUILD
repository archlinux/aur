# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname=adfind
pkgver=1
pkgrel=1
pkgdesc="Admin Panel Finder"
arch=(any)
url="https://github.com/sahakkhotsanyan/adfind"
license=('GPL')
depends=(php)
source=("https://github.com/sahakkhotsanyan/adfind/archive/master.zip")
md5sums=(170cf9815e0064902d442e1ba6e21d09)

package() {
	cd "$srcdir"/"$pkgname"-master
        chmod +x "$pkgname"
        install -dm755 "$pkgdir"/usr/bin/
        cp "$pkgname" "$pkgdir"/usr/bin/
}
