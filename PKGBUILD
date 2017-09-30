# Maintainer: <https://aur.archlinux.org/user/vorbote>
pkgname=vim-vi
pkgver=1
pkgrel=1
pkgdesc="Replace heirloom vi from core with vim using symlinks."
arch=('any')
url="https://aur.archlinux.org/packages/vim-vi"
license=('GPL')
depends=('vim')
provides=('vi')
conflicts=('vi')
replaces=('vi')

package() {
	mkdir -p "$pkgdir"/usr/bin
	ln -sf /usr/bin/vim "$pkgdir"/usr/bin/edit
	ln -sf /usr/bin/vim "$pkgdir"/usr/bin/ex
	ln -sf /usr/bin/vim "$pkgdir"/usr/bin/vedit
	ln -sf /usr/bin/vim "$pkgdir"/usr/bin/vi
	ln -sf /usr/bin/vim "$pkgdir"/usr/bin/view
	ln -sf /usr/bin/vim "$pkgdir"/usr/bin/redit
	ln -sf /usr/bin/vim "$pkgdir"/usr/bin/rex
	ln -sf /usr/bin/vim "$pkgdir"/usr/bin/rvedit
	ln -sf /usr/bin/vim "$pkgdir"/usr/bin/rvi
}
