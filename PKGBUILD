pkgname=luna-todo-git
pkgver=3.1.0
pkgrel=2
pkgdesc="luna-todo (git versiion)"
arch=('x86_64')
url="https://gitlab.com/materac-luna-project/luna-todo"
license=('GPL-3.0-or-later')
depends=('glibc' 'sqlite')
makedepends=('git' 'make' 'gcc')
source=("git+$url.git")
sha256sums=('SKIP')

build() {
	cd "$srcdir/luna-todo"
	make build
}

package() {
	cd "$srcdir/luna-todo"
	make ROOT="$pkgdir" install
}
