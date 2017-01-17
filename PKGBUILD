# Maintainer: Mellich <mellich@gmx.net>
pkgname=light-locker-settings
pkgver=master
pkgrel=1
epoch=
pkgdesc="A simple GUI configuration utility for light-locker"
arch=("any")
url="https://github.com/Antergos/light-locker-settings"
license=('GPL')
groups=()
depends=("light-locker" "python-psutil" "python")
makedepends=()
checkdepends=()
optdepends=("xfce4-power-manager>=1.3.0: Sync settings with XFCE4")
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/Antergos/light-locker-settings/archive/master.zip")
noextract=()
md5sums=('600dcfb665cb45cee58d793057e68e72')
validpgpkeys=()

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
