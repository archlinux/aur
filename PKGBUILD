# Maintainer: Joe Davison <joedavison.davison@gmail.com>
# Contributor: Thayer Williams <thayer@archlinux.org>

pkgname=archlinux-themes-gdm-old
pkgver=1.4
pkgrel=3
pkgdesc="Arch Linux themes for legacy GNOME Desktop Manager (GDM =< 2.28)"
arch=('any')
url="http://www.archlinux.org/"
license=('CCPL:cc-by-sa')
optdepends=('gdm-old: to implement these themes')
source=(ftp://ftp.archlinux.org/other/artwork/archlinux-themes-gdm-${pkgver}.tar.gz)
md5sums=('bce4170608ed6f982f92277b7279ab98')

build() {
	cd ${srcdir}/archlinux-themes-gdm-${pkgver}
	mkdir -p ${pkgdir}/usr/share/gdm/themes

	mv ${srcdir}/archlinux-themes-gdm-1.4/* ${pkgdir}/usr/share/gdm/themes
}
