# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=cpumanager-git
pkgver=2.1
pkgrel=1
#epoch=
pkgdesc="CPU controler"
arch=('any')
url="https://github.com/nbebaw/cpumanager-git"
license=('GPL')
#groups=()
depends=(zenity)
#makedepends=()
#checkdepends=()
#optdepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#changelog=
source=("git+https://github.com/nbebaw/cpumanager-git.git")
#noextract=()
md5sums=('SKIP')
#validpgpkeys=()

#prepare() {
#	cd "$pkgname-$pkgver"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}

#build() {
#	cd "$pkgname-$pkgver"
#	./configure --prefix=/usr
#	make
#}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
	cd "$pkgname"
	#make DESTDIR="$pkgdir/" install
	install -Dm755 turbo_boost_v2.1.sh ${pkgdir}/usr/bin/turbo_boost_v2.1  # -> /usr/bin/turbo... 
}
