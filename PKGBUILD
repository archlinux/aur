# Maintainer: Tanay Pant <tanay1337@gmail.com>
pkgname=toimer-git
pkgver=r1.g99f324a
pkgrel=1
pkgdesc="An extremely minimalist timer for the CLI."
arch=('any')
url="https://github.com/tanay1337/taskman"
license=('MIT')
makedepends=('git')
provides=("toimer")
conflicts=("toimer")
source=('git+https://github.com/tanay1337/toimer.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/toimer"
	echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/toimer"
  install -Dm755 toimer "$pkgdir/usr/bin/toimer"
}
