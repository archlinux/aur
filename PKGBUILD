# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: nbebaw
pkgname=cpumanagergui
pkgver=1.2
pkgrel=6
pkgdesc="CPU controler with a gui"
arch=('any')
url="https://github.com/nbebaw/cpumanagergui"
license=('GPL')
#makedepends=('')
depends=('gambas3-gb-form'
	 'gambas3-gb-gtk'
	 'gambas3-gb-image'
	 'gambas3-gb-qt5'
	 'gambas3-gb-qt5-webkit'
	 'gambas3-runtime')
source=("git+https://github.com/nbebaw/cpumanagergui.git")
md5sums=('SKIP')

#prepare() {
#	tar -zxvf data.tar.gz
#}

package() {
	cd "$pkgname"/App
	install -Dm755 cpumanagergui.gambas ${pkgdir}/usr/bin/cpu-manager
	install -Dm644 cpumanagergui.desktop ${pkgdir}/usr/share/applications/cpumanagergui.desktop
	install -Dm644 cpumanager.png ${pkgdir}/usr/share/pixmaps/cpumanager.png
}
