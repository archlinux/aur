pkgname=sudo-rs-symlink
pkgdesc="Symlinks to sudo from sudo-rs"
pkgver=0.2.5
arch=(any)
pkgrel=2
depends=(sudo-rs)
provides=(sudo)
conflicts=(sudo)
source=(sudo-pam)
sha256sums=('d1738818070684a5d2c9b26224906aad69a4fea77aabd960fc2675aee2df1fa2')
package (){
	mkdir -p "$pkgdir"/usr/bin
	install -Dm644 sudo-pam "$pkgdir"/etc/pam.d/sudo
	#ln -sf /usr/bin/visudo-rs "$pkgdir"/usr/bin/visudo
	ln -sf /usr/bin/sudo-rs "$pkgdir"/usr/bin/sudo
}
