# Maintainer: ALEXPRO100 <alealexpro100@ya.ru>

pkgname=grub-theme-cyberre
_theme=CyberRe
pkgver=1.0.0
pkgrel=2
pkgdesc="CyberRe Grub-theme."
url="https://www.opendesktop.org/s/Gnome/p/1420727"
arch=('any')
license=('CC0')
depends=('grub-common')
source=("https://github.com/alealexpro100/various_files/raw/master/Grub2-theme%20${_theme}%20${pkgver}.tar.gz")

package() {
	cd ${srcdir}
	install -dm755 ${pkgdir}/usr/share/grub/themes
	cp -rf --no-preserve=ownership "${_theme} ${pkgver}/${_theme}" ${pkgdir}/usr/share/grub/themes
}
md5sums=('29202781294950eceb49865c88df01f9')
