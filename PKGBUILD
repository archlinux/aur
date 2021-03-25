# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: zzy-ac <1304024859@qq.com>
pkgname=pvz_beta
pkgver=1.0.1
pkgrel=1
pkgdesc="pvz_beta 技能魔改版的pvz,源自贴吧老哥分享"
arch=(x86_64)
url="https://github.com/zzy-ac/plantsvszombies"
license=('GPL')
depends=('wine' 'deepin-wine-helper')
provides=(pvz_beta=$pkgver)
replaces=()
backup=()
options=()
install=
changelog=
source=("https://hub.fastgit.org/zzy-ac/plantsvszombies/raw/master/PvZ_beta/PvZ_beta.tar.gz")
noextract=()
md5sums=("fefd66038fa1f8e8c7eeb87bca2df364")
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
 
 
