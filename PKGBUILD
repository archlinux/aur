# Maintainer: Marcin Mielniczuk <marmistrz.dev@gmail.com>
pkgname=lichify-git
pkgver=0.1.2
pkgrel=1
pkgdesc="A simple daemon to notify about new lichess.org games"
arch=("any")
url="https://github.com/marmistrz/lichify"
license=('GPLv3')
depends=('python-notify2' 'python-requests')
makedepends=('git')
source=("git+https://github.com/marmistrz/lichify.git#tag=v$pkgver")
sha1sums=("SKIP")

package() {
	cd lichify
	share="$pkgdir/usr/share/"
	mkdir -p "$share"
	cp -r "src" "$share/lichify"
}
