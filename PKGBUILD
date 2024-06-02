# Maintainer: Utkarsh Kumar Singh <utkarshkrsingh@proton.me>
pkgname=taskhub
pkgver=1.0
pkgrel=1
pkgdesc="a cli-based todo-list application written in c++"
arch=('x86_64')
url="https://github.com/utkarshkrsingh/taskhub"
license=('BSD2')
makedepends=('git')
source=("taskhub::git+https://github.com/utkarshkrsingh/taskhub.git")
sha256sums=('SKIP')

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	install -Dm755 ./taskhub "$pkgdir/usr/bin/taskhub"
}
