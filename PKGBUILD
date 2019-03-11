# Maintainer: utsi

pkgname=fleep-bin
pkgver=1.0.17
pkgrel=1
pkgdesc="Messenger for all your teams and projects. Fleep enables communication within and across organizations - be it your team chats, project communication or 1:1 conversations."
arch=('x86_64')
url="https://fleep.io/"
license=('custom')
depends=('qt5-webengine' 'qt5-multimedia' 'qt5-quickcontrols')
source=(https://builds.fleep.ee/linux/pool/stretch/fleep/fleep_${pkgver}-${pkgrel}_amd64.deb)
sha512sums=('a66e8c57493b2f3eba9c460fe9959b60a9b3adb0f389d725abe5269bfac2799853cf61ad5600f36ef700a0feb2bb2a52140dfae2cdd6989cc7042c7e6b43c146')

build() {
	cd ${srcdir}
	tar xf data.tar.xz
}

package() {
	cd ${srcdir}
	cp -r usr ${pkgdir}
}
