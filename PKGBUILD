# Maintainer: Vitor Gonçalves <vitorg@tilde.team>
_pkgname=input
pkgname=input-prompt
pkgver=0.7.2
pkgrel=1
pkgdesc="Prompt for input with readline-like key bindings"
arch=('x86_64')
url="https://github.com/nmeum/input"
license=('GPL3')
depends=('readline')
makedepends=('make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nmeum/$_pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz")

build() {
	cd "$_pkgname-$pkgver"
	make
}

package() {
	cd "$_pkgname-$pkgver"
	make PREFIX="$pkgdir/usr" install
}
sha256sums=('47b1ad0603ede5ae3dd1f014b2eca7cb57b0da3a96857d53d5cf7e2688b8562a')
