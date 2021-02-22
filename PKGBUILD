# Maintainer: KoNicks <konicksdev@gmail.com>
pkgname=koffe
pkgver=1.2.3
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
md5sums=('87596cfe89b50ea249d6e6b1b3e476c7')
validpgpkeys=()

package() {
	tar xzf $srcdir/koffe.tar.gz -C $srcdir/
	mkdir $pkgdir/usr/
	mkdir $pkgdir/usr/bin/
	mkdir $pkgdir/usr/share/
	cp $srcdir/koffe $pkgdir/usr/bin/
	mkdir $pkgdir/usr/share/koffe/
	cp $srcdir/install $pkgdir/usr/share/koffe/
	cp $srcdir/pi.is $pkgdir/usr/share/koffe/
}
