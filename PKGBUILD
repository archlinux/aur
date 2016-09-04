# Maintainer: Marcin Mielniczuk <marmistrz.dev@gmail.com>
pkgname=lichify-git
pkgver=0.1
pkgrel=3
pkgdesc="A simple daemon to notify about new lichess.org games"
arch=("any")
url="https://github.com/marmistrz/lichify"
license=('GPLv3')
depends=('python-notify2' 'python-requests')
makedepends=('git')
source=("git+https://github.com/marmistrz/lichify.git#commit=51d3fea42583c65c6a87fc7e1b009cd58c732d25")
sha1sums=("SKIP")

package() {
	cd lichify
	share="$pkgdir/usr/share/"
	mkdir -p "$share"
	cp -r "src" "$share/lichify"
}
