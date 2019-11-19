# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=cpumanagergui
pkgver=0.1
pkgrel=2
pkgdesc="CPU controler with a gui"
arch=('any')
url="https://github.com/nbebaw/cpumanagergui"
license=('GPL')
#depends=()
#makedepends=()
#checkdepends=()
#optdepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#changelog=
source=("git+https://github.com/nbebaw/cpumanagergui.git")
md5sums=('SKIP')

#prepare() {
#	tar -zxvf data.tar.gz
#}

package() {
	cd "$pkgname"
	install -Dm755 cpumanagergui ${pkgdir}/usr/bin/cpumanagergui
	install -Dm755 cpumanagergui.desktop ${pkgdir}/usr/share/applications/cpumanagergui.desktop
	install -Dm755 cpumanager.png ${pkgdir}/usr/share/pixmaps/cpumanager.png
}
