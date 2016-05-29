# Maintainer: Hythlodaeus <matteodelseppiaomm@gmail.com>

pkgname=Vega
pkgver=1
pkgrel=1
epoch=
pkgdesc="Vega is a platform for testing the security of web applications"
arch=(x86_64)
url="https://subgraph.com/vega/"
license=('Eclipse Public License 1.0')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=('gtk' 'webkitgtk' 'jdk8-openjdk')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://dist.subgraph.com/downloads/VegaBuild-linux.gtk.x86_64.zip")
noextract=()
md5sums=(SKIP)
validpgpkeys=()


build() {
	echo Installing required webkitgtk and openjdk
        sudo pacman -S webkitgtk unzip jdk8-openjdk
        sudo unzip VegaBuild-linux.gtk.x86_64.zip
        sudo mv vega /usr/share
}

package() {
	sudo ln -sv /usr/share/vega/Vega /usr/bin/vega
}
