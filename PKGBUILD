# Maintainer: CodeRadu <radu.gabi.m@gmail.com>
pkgname=the-powder-toy-bin
pkgver=97.0
pkgrel=1
epoch=
pkgdesc="The Powder Toy is a free physics sandbox game."
arch=("x86_64")
url="https://powdertoy.co.uk"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/Download/powder-lin64.zip"
				"the-powder-toy.png"
				"the-powder-toy.desktop")
noextract=()
sha256sums=('f78422521ac05833082b5bb82457d89831da199085dcea2e13878739ca9fe181'
            '292ef3dfefa8367bb7daa1c634612492d7636d9ecf9d8d51af45d036e0b491b0'
            '199222c2306f8704eb6fdb6f509cfd94a5ab433578049e73ed35e869e9c3fc56')
validpgpkeys=()


package() {
	cd "$srcdir"
	install -Dv -m 644 -o root LICENSE $pkgdir/usr/share/licenses/the-powder-toy/LICENSE
	install -Dv -m 775 -o root powder $pkgdir/usr/bin/powder
	install -Dv -m 644 -o root the-powder-toy.png $pkgdir/usr/share/icons/hicolor/256x256/apps/the-powder-toy.png
	install -Dv -m 665 -o root the-powder-toy.desktop $pkgdir/usr/share/applications/the-powder-toy.desktop
}
