# Maintainer: Jason Gonzalez <jason at jasong-designs dot com>

pkgname=jgd-cobaltblue
pkgver=10_23_18
pkgrel=1
pkgdesc="Cobalt Blue colored themes for GTK 3.20+ and Openbox."
arch=('i686' 'x86_64')
url="http://www.jasong-designs.com/2017/09/19/jgd-cobaltblue/"
license=('GPL3')
depends=('gtk3' 'gtk2' 'gtk-engines')
optdepends=('openbox: optional window manager theme' 'ttf-dejavu: font support')
changelog=
source=("https://github.com/jgpws/jgd-cobalt-blue/raw/master/downloads/$pkgname-${pkgver//_/-}.tar.gz")

package() {
	cd "${srcdir}"
	tar -xzvf jgd-cobaltblue-10-23-18.tar.gz
	sudo cp -R JGD-CobaltBlue /usr/share/themes
}


md5sums=('69b23c7b6fa9515ab286d0afce852e52')
