# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: KoNicks <konicksdev@gmail.com>
pkgname=koffe
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="simple tool for creating easy to use and offline-friendly arch installers with aur support"
arch=(x86_64 i686 ARM)
url=""
license=('GPL')
groups=()
depends=(bash autoconf automake binutils bison fakeroot file findutils flex gawk gcc gettext grep groff gzip libtool m4 make pacman patch pkgconf sed sudo texinfo which archiso git)
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
source=('install' 'koffe' 'pi.is')
noextract=()
md5sums=(c0c0b373309e612ceb8b6ce030b81b0b 13f5f49c1da77a9421c77d0928286faa 2517bc633960b8e53d16806afde59bba)
validpgpkeys=()

package() {
	mkdir $pkgdir/usr/
	mkdir $pkgdir/usr/bin/
	mkdir $pkgdir/usr/share/
	cp $startdir/koffe $pkgdir/usr/bin/
	mkdir $pkgdir/usr/share/koffe/
	cp $startdir/install $pkgdir/usr/share/koffe/
	cp $startdir/pi.is $pkgdir/usr/share/koffe/
}
