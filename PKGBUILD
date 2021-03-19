# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: zzy-ac <1304024859@qq.com>
pkgname=plantsvszombies
pkgver=1.1
pkgrel=1
pkgdesc="plantsvszombies by deepin-wine5"
arch=(x86_64)
url="https://github.com/zzy-ac/plantsvszombies"
license=('GPL')
depends=('deepin-wine5' 'deepin-wine5-helper')
provides=(plantsvszombies=$pkgver)
replaces=()
backup=()
options=()
install=
changelog=
source=("https://hub.fastgit.org/zzy-ac/plantsvszombies/raw/master/plantsvszombies.tar.gz")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

prepare() {
	mkdir "$pkgname-$pkgver"
	cp -r opt "$pkgname-$pkgver"/opt
	cp -r usr "$pkgname-$pkgver"/usr
}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
	cd "$pkgname-$pkgver"
    cp -r opt ${pkgdir}
    cp -r usr ${pkgdir}
}
 
 
