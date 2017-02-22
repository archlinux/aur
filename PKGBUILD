# Maintainer: Jason Gonzalez <jason at jasong-designs dot com>

pkgname=jgd-black
pkgver=02_22_17
pkgrel=1
pkgdesc="Black and gray GTK theme collection (GTK 3.20+)"
arch=('i686' 'x86_64')
url="http://www.jasong-designs.com/2017/02/04/jgd-black-gtk3/"
license=('GPL3')
depends=('gtk3' 'gtk2' 'gtk-engines')
optdepends=('openbox: optional window manager theme' 'ttf-dejavu: font support')
changelog=
source=("https://github.com/jgpws/jgd-black/raw/master/downloads/$pkgname-${pkgver//_/-}.tar.gz")

package() {
	cd "${srcdir}"
	tar -xzvf jgd-black-02-22-17.tar.gz
	sudo cp -R JGD-Black /usr/share/themes
}

md5sums=('6cd0387921ebfc20572700a6b31030e4')
