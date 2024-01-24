# Maintainer: Vitor Gonçalves <vitorg@tilde.team>
_pkgname=insomnia
pkgname=insomnia-irc
pkgver=1.0.4
pkgrel=1
pkgdesc="A frontend for the hii IRC client"
arch=('x86_64')
url="https://github.com/nmeum/insomnia"
license=('GPL3')
depends=('hii' 'tmux' 'input-prompt' 'gawk>=4.0.0')
makedepends=('make')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/nmeum/$_pkgname/archive/refs/tags/$pkgver.tar.gz")

build() {
	cd "$_pkgname-$pkgver"
	make
}

package() {
	cd "$_pkgname-$pkgver"
	make PREFIX="$pkgdir/usr" install
}
sha256sums=('7c0d585c61581f2477551b5d8bdc148528fd77a384b6333fe1e7acb1a5b3897a')
