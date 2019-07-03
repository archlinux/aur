#Maintainer: Morgana <morganamilo@gmail.com>

pkgname="indicator-stickynotes"
pkgver=1.0.0
pkgrel=1
pkgdesc='Sticky Notes'
arch=('any')
url="https://launchpad.net/indicator-stickynotes"
license=('GPL3')
depends=('python3' 'python-gobject' 'libappindicator-gtk3' 'gtksourceview3')
source=("https://launchpad.net/~umang/+archive/ubuntu/indicator-stickynotes/+files/${pkgname}_${pkgver}-0~ppa1_all.deb")
sha256sums=('17ccb4e1e04f007dd497090f2ece803c179f0164dc86c294a4b31c20a204631a')

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

