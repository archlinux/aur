# Maintainer: Jaume Delclòs <jaume@delclos.com>
pkgname=getopts
pkgver=1.1.0
pkgrel=1
pkgdesc="getopts(1) for fish"
arch=(any)
url="https://github.com/fisherman/getopts"
license=('MIT')
depends=(fish)
source=("https://github.com/fisherman/getopts/archive/${pkgver}.tar.gz")
md5sums=('860ececc55ffe333b09005339f695640')

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 getopts.fish $pkgdir/usr/share/fish/functions/getopts.fish
}
