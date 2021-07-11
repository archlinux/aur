# Maintainer: alecromski <alecromski@gmail.com>
pkgname=asus-touchpad-numpad-driver
pkgver=1.0
pkgrel=1
pkgdesc="asus touchpad numpad toggler"
arch=('any')
url="https://github.com/mohamed-badaoui/asus-touchpad-numpad-driver"
license=('GPL')
groups=()
depends=('python>=3.8'
		'libevdev'
		'python-libevdev'
		'i2c-tools'
		'git')
makedepends=()
checkdepends=()
optdepends=()
provides=(asus-touchpad-numpad-driver)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/OppaiWeeb/asus-touchpad-numpad-driver/releases/download/1.1/asus-touchpad-numpad-driver.zip")
noextract=($source)
md5sums=(SKIP)
validpgpkeys=()

prepare() {
	echo "[!]Prepare install"
}

package() {
	./install.sh
}
