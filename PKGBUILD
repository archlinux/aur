# Maintainer: Hythlodaeus <matteodelseppiaomm@gmail.com>

pkgname=vega
pkgver=1.0
pkgrel=1
pkgdesc="Vega is a platform for testing the security of web applications"
arch=(x86_64)
url="https://subgraph.com/vega/"
license=('Eclipse Public License 1.0')
provides=('vega')
depends=('jd8-openjdk' 'webkitgtk2')
conflicts=('vega')
source=("https://dist.subgraph.com/downloads/VegaBuild-linux.gtk.x86_64.zip")

build() {
	echo Installing required unzip
        sudo pacman -S unzip
        sudo unzip VegaBuild-linux.gtk.x86_64.zip
        sudo mv vega /usr/share
}

package() {
	sudo ln -sv /usr/share/vega/Vega /usr/bin/vega
}

