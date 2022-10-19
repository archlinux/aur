# Maintainer: Ashutosh Tripathi pushpatripathi1111@gmail.com
pkgbase=hello.sh
pkgname=hello.sh
pkgdesc="JUST Hello!!"
pkgver=1.0
pkgrel=1
arch=(x86_64)
url="https://github.com/stupid-kid-af/hello.sh"
license=('MIT')
provides=(hello)
depends=('glibc')
makedepends=('git')
install=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd hello.sh
	chmod a+x hello
}
package() {
	cd hello.sh
	install -Dm755 ./"$pkgname" "$pkgdir/usr/bin/$pkgname"

}
