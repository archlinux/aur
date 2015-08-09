# Maintainer: Benjamin James <benjamin-james@utulsa.edu>
# Contributor: Benjamin Andresen <benny(at)klapmuetz(dot)org>
# Contributor: Gadget3000 <gadget3000 at msn dot com>
# Contributor: Lucas Saliés Brum <sistematico@gmail.com>

pkgname=fortune-mod-archlinux
pkgver=1
pkgrel=3
pkgdesc="#archlinux fortune cookie file"
arch=('any')
license=('custom:PublicDomain')
url="irc://irc.freenode.org/archlinux"
depends=('fortune-mod')
groups=('fortune-mods')

source=('archlinux')
sha256sums=('3614895bb40fa1e8e685fde7aac5e617f08810098d00c583f74ff9f26e389f76')

build() {
	strfile ${srcdir}/archlinux ${srcdir}/archlinux.dat
}

package() {
	  install -D -m644 ${srcdir}/archlinux ${pkgdir}/usr/share/fortune/archlinux
	  install -D -m644 ${srcdir}/archlinux.dat ${pkgdir}/usr/share/fortune/archlinux.dat
}
