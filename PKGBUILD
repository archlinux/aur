# Maintainer: ALEXPRO100 <alealexpro100@ya.ru>

pkgname=grub-theme-cyberre
_theme=CyberRe
pkgver=1.0.0
pkgrel=1
pkgdesc="CyberRe Grub-theme."
url="https://www.opendesktop.org/s/Gnome/p/1420727"
arch=('any')
license=('CC0')
depends=('grub-common')
source=("https://download1518.mediafire.com/8va901wkd1hg/nd3qlksb1pwkg3n/Grub2-theme+${_theme}+${pkgver}.tar.gz")

package() {
	cd ${srcdir}
	install -dm755 ${pkgdir}/usr/share/grub/themes
	cp -rf --no-preserve=ownership "${_theme} ${pkgver}/${_theme}" ${pkgdir}/usr/share/grub/themes
}
md5sums=('29202781294950eceb49865c88df01f9')
