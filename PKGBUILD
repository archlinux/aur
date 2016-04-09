pkgname=cmakeprojectmanager2-bin
pkgdesc="Enhanced CMake Project Manager plugin for Qt Creator."
pkgver=20160401
pkgrel=1
arch=('x86_64')
url="https://github.com/h4tr3d/cmakeprojectmanager2"
license=('GPL')
source=(http://ppa.launchpad.net/adrozdoff/qtcreator-git/ubuntu/pool/main/q/qtcreator-git-plugin-cmake2/qtcreator-git-plugin-cmake2_20160401.1-25ff604-trusty~ppa3_amd64.deb)
md5sums=('SKIP')
depends=('')

package() {
	mkdir data
	tar xf data.tar.xz --directory data/
	mkdir -p ${pkgdir}/usr/lib/qtcreator/plugins/
	cp -r data/opt/qtcreator-git/lib/x86_64-linux-gnu/qtcreator/plugins/* ${pkgdir}/usr/lib/qtcreator/plugins/
	mkdir -p ${pkgdir}/usr/share/qtcreator/templates/wizards/projects/
	cp -r data/opt/qtcreator-git/share/qtcreator/templates/wizards/projects/* ${pkgdir}/usr/share/qtcreator/templates/wizards/projects/
}
