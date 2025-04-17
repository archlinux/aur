pkgname=sudo-rs-symlink
pkgdesc="Symlinks to sudo from sudo-rs"
pkgver=0.2.5
arch=(x86_64)
pkgrel=1
depends=(sudo-rs)
provides=(sudo)
conflicts=(sudo)
package (){
	mkdir -p "$pkgdir"/usr/bin
	ln -sf /usr/bin/visudo-rs "$pkgdir"/usr/bin/visudo
	ln -sf /usr/bin/sudo-rs "$pkgdir"/usr/bin/sudo
}
