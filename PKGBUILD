# Maintainer: imoutocon
pkgname=uwu
pkgver=0.1
pkgrel=3
pkgdesc="uwu your terminal today!"
arch=('x86_64')
url="https://github.com/98WuG/uwu"
license=('GPL')
depends=('glibc')
makedepends=('gcc')
checkdepends=()
changelog=
source=("https://github.com/98WuG/${pkgname}/archive/v${pkgver}.tar.gz")
noextract=()
md5sums=("ad5d777b3b155b025f237f9a4546f994")
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
    mkdir -p $pkgdir/usr/bin
	install -Dm755 uwu "$pkgdir/usr/bin/$pkgname"
}
