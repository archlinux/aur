pkgname=treefacts
pkgver=1.0.0
pkgrel=1
pkgdesc="A CLI application that displays facts about trees"
arch=(x86_64)
url="https://github.com/Mr-Owllers/treefacts"
license=('MIT')
depends=(curl)
makedepends=(git make gcc)
provides=(treefacts)
source=("git+$url")
md5sums=('SKIP')

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
