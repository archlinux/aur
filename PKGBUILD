# Maintainer: Erdal Mutlu <erdal at sisiya dot org>
pkgname=sisiya-webui-php
pkgver=0.6.31
pkgrel=1
epoch=
pkgdesc="The SisIYA daemon."
arch=('any')
url="http://www.sisiya.org"
license=('GPL2')
groups=()
#depends=('php' 'php-gd' 'php-mysql' 'php-pgsql')
depends=('php' 'php-gd' 'php-pgsql' 'sisiya-webui-images')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=(
	'etc/sisiya/sisiya-webui-php/dbconf.php'
	'etc/sisiya/sisiya-webui-php/sisiya_admin_conf.php'
	'etc/sisiya/sisiya-webui-php/sisiya_common_conf.php'
	'etc/sisiya/sisiya-webui-php/sisiya_gui_conf.php'
	)
options=()
install=$pkgname.install
changelog=
#source=("$pkgname-$pkgver-$pkgrel.tar.gz")
source=("http://sourceforge.net/projects/sisiya/files/sisiya/$pkgver/pacman/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('5abee8382a7f6690e0b6c482bbce2891') #generate with 'makepkg -g'

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make "DESTDIR=$pkgdir" install
}
