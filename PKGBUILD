#Maintainer: Morgana <morganamilo@gmail.com>

pkgname="indicator-stickynotes"
pkgver=0.5.8
pkgrel=1
pkgdesc='Sticky Notes'
arch=('any')
url="https://launchpad.net/indicator-stickynotes"
license=('GPL3')
depends=('python3' 'python-gobject' 'libappindicator-gtk3' 'gtksourceview3')
source=("https://launchpad.net/~umang/+archive/ubuntu/indicator-stickynotes/+files/${pkgname}_${pkgver}-0~ppa1_all.deb")
sha256sums=('f2b14016f885937588af919ff7d2f101ae5d503476e98a92a420d99c06c21d5b')

build() {
	cd ${srcdir}
	ar x "${pkgname}_${pkgver}-0~ppa1_all.deb" > /dev/null
	tar -xf data.tar.xz
}

package() {
	cd ${srcdir}

	cp -R etc ${pkgdir}
	cp -R usr ${pkgdir}
}

