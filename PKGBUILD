# Maintainer: imoutocon <mail@niichan.moe>
pkgname=uwu
pkgver=0.1
pkgrel=1
pkgdesc="uwu your terminal today!"
arch=('x86_64')
url="https://git.niichan.moe/98WuG/uwu"
license=('GPL')
depends=('glibc')
makedepends=('gcc')
checkdepends=()
changelog=
source=("https://git.niichan.moe/98WuG/${pkgname}/archive/${pkgver}.tar.gz")
noextract=()
md5sums=("e8a17d4b4b927e6265d456eb4cbc09b1")
validpgpkeys=()

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
    mkdir -p $pkgdir/usr/bin
	install -Dm755 uwu "$pkgdir/usr/bin/$pkgname"
}
