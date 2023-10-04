# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Wyatt Kinard wyattkinard@skiff.com

#Atention:
#I did not create crumb, nor do I maintain it (not a lot anyways), but I maintain the aur package
#
#
pkgname=crumb
pkgver=1.0
pkgrel=1.0
epoch=
pkgdesc="Crumb is a high level, functional, interpreted, dynamically typed, general-purpose programming language, with a terse syntax, and a verbose standard library."
arch=('x86_64')
url="https://github.com/liam-ilan/crumb/tree/main/src"
license=('GPL')
groups=()
depends=()
makedepends=('gcc'
'coreutils')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('crumb::git+https://github.com/liam-ilan/crumb.git')
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "$srcdir"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd crumb/src
	gcc *.c -Wall -lm -o crumb
}

check() {
	echo almost done...
}
package() {
	cd crumb/src
	sudo mv crumb /usr/bin
}


