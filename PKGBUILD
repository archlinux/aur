# Maintainer: KoNicks <konicksdev@gmail.com>
pkgname=koffe
pkgver=1.2.1
pkgrel=1
epoch=
pkgdesc="simple tool for creating easy to use and offline-friendly arch installers with aur support"
arch=(x86_64 i686 ARM)
url=""
license=('GPL')
groups=()
depends=(bash autoconf automake binutils bison fakeroot file findutils flex gawk gcc gettext grep groff gzip libtool m4 make pacman patch pkgconf sed sudo texinfo which archiso git pacman-contrib)
makedepends=(tar)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('koffe.tar.gz')
noextract=()
md5sums=('688099b0a34f307e96ad19d49e1c4e72')
validpgpkeys=()

package() {
	tar xzf $startdir/koffe.tar.gz -C $startdir/
	mkdir $pkgdir/usr/
	mkdir $pkgdir/usr/bin/
	mkdir $pkgdir/usr/share/
	cp $startdir/koffe $pkgdir/usr/bin/
	mkdir $pkgdir/usr/share/koffe/
	cp $startdir/install $pkgdir/usr/share/koffe/
	cp $startdir/pi.is $pkgdir/usr/share/koffe/
}
