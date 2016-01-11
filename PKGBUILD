pkgname="indicator-stickynotes"
pkgver=0.5.6
pkgrel=1
pkgdesc='Sticky Notes'
arch=('any')
license=('GPL3')
depends=('python3' 'libappindicator-gtk3')
source=("https://launchpad.net/~umang/+archive/ubuntu/indicator-stickynotes/+files/${pkgname}_${pkgver}-0ppa1_all.deb")
sha256sums=('c239f9763995463dab33abe12eda71421a5d11c1dfc2cbeea4fab1c6bc2235b8')

build() {
	cd ${srcdir}
	ar x ${pkgname}_${pkgver}-0ppa1_all.deb > /dev/null
	tar -xf data.tar.xz
}

package() {
	cd ${srcdir}

    cp -R etc ${pkgdir}
    cp -R usr ${pkgdir}
}
