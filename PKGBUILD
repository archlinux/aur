# Contributor: Daniel Milde <daniel@milde.cz>

pkgname=gdm-theme-brasillinux-eye
pkgver=0.6.1
_srcrel=758977
pkgrel=2
pkgdesc="Brasillinux eye GDM theme"
arch=('i686' 'x86_64')
url="http://gnome-look.org/content/show.php/Brasillinux+Eye?content=43700"
license=('custom')
depends=('gdm-old')
source=(https://launchpad.net/ubuntu/+source/gdm-themes/${pkgver}/+build/${_srcrel}/+files/gdm-themes_${pkgver}_all.deb)
md5sums=('7dd39b89b7ccab47d30b2f96ad71f94a')


build() {
	cd ${srcdir}
	ar x gdm-themes_0.6.1_all.deb
	tar xzf data.tar.gz
	
	install -d ${pkgdir}/usr/share/gdm/themes/olho
	install -D ${srcdir}/usr/share/gdm/themes/olho/GdmGreeterTheme.desktop ${pkgdir}/usr/share/gdm/themes/olho
	install -D ${srcdir}/usr/share/gdm/themes/olho/olho.jpg ${pkgdir}/usr/share/gdm/themes/olho
	install -D ${srcdir}/usr/share/gdm/themes/olho/olho.xml ${pkgdir}/usr/share/gdm/themes/olho
	install -D ${srcdir}/usr/share/gdm/themes/olho/screenshot.png ${pkgdir}/usr/share/gdm/themes/olho
}
