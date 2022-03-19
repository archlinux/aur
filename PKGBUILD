#Maintainer: Jeff Hughes <jeff.hughes@gmail.com>

pkgname="indicator-stickynotes"
pkgver=1.0.1
pkgrel=1
pkgdesc='Sticky Notes'
arch=('any')
url="https://launchpad.net/indicator-stickynotes"
license=('GPL3')
depends=('python3' 'python-gobject' 'libappindicator-gtk3' 'gtksourceview3')
source=("https://launchpad.net/~umang/+archive/ubuntu/indicator-stickynotes/+files/${pkgname}_${pkgver}-0~ppa1_all.deb")
sha256sums=('971d8cd91329becd94984d0c09a0955627d92779cd72c0fb2079cc6d008237d6')

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

