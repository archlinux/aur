# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: zzy-ac <1304024859@qq.com>
pkgname=com.pal.dosbox
pkgver=0.95
pkgrel=2
pkgdesc="仙剑奇侠传DOS经典版，原声音效，少年时的武侠回忆
 仙剑奇侠传DOS经典版，原声音效，少年时的武侠回忆"
arch=(x86_64)
url="https://github.com/zzy-ac/games"
license=('GPL')
depends=('dosbox')
provides=(com.pal.dosbox=$pkgver)
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/zzy-ac/games/raw/main/com.pal.dosbox.tar.gz")
noextract=()
md5sums=(a1a01f1356ad2cad9595d48866a843fe)
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

install=com.pal.dosbox.install

 
