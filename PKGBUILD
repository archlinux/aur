# Maintainer: Nicolas Steinmetz <contact+archlinux@cerenit.fr>
pkgname=git-octopus
pkgver=1.4
pkgrel=1
pkgdesc="The continuous merge workflow."
arch=('any')
url="https://github.com/lesfurets/git-octopus/"
license=('GPL3')
depends=('git')
source=("https://github.com/lesfurets/git-octopus/archive/v$pkgver.tar.gz")
sha256sums=("e2800eea829c6fc74da0d3f3fcb3f7d328d1ac8fbb7b2eca8c651c0c903a50c3")

build() {
	cd "$pkgname-$pkgver"
	make build
}

package() {
	cd "$pkgname-$pkgver"
	make prefix="$pkgdir/usr/" install
}
