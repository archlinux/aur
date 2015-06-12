# Maintainer: Lara Maia <lara@craft.net.br>
# Contributor: estranho <estranho@diogoleal.com>
# Contributor: tsester <spyridon.papanastasiou@gmail.com>
# Contributor: dserban <dserban01@yahoo.com>
# Contributor: LeCrayonVert <sunrider@laposte.net>
# Contributor: jelly <jelle@vdwaa.nl>
# Contributor: evr <evanroman at gmail>

pkgname=agedu
pkgver=20141026
_pkghash=a2b5efc
pkgrel=1
epoch=1
pkgdesc="Track down wasted disk space"
arch=(i686 x86_64)
url="http://www.chiark.greenend.org.uk/~sgtatham/agedu/"
license=(MIT)

source=("http://www.chiark.greenend.org.uk/~sgtatham/$pkgname/$pkgname-$pkgver.$_pkghash.tar.gz")
md5sums=('ecbf3d66e1cb952f8719ec40b8ce39df')

build() {
    cd $pkgname-$pkgver.$_pkghash
    ./configure --prefix=/usr
    make
}

package() {
	cd $pkgname-$pkgver.$_pkghash
	make DESTDIR="$pkgdir" install
}
