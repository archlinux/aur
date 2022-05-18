# Maintainer: Evangelos Labrou <vagoslabrou@gmail.com>

pkgname=taverner-git
_name="${pkgname%-git}"
pkgver=0.0.1
pkgrel=1

pkgdesc="cli launcher menu for games (or anything), the UNIX way."
arch=('any')
url="https://github.com/vagos/taverner"
license=('GPL')

depends=()
makedepends=(git)
checkdepends=()
optdepends=('dmenu: recommended app launcher')

provides=("$_name")

source=("git+$url")
sha256sums=('SKIP')

package() {
	cd "$_name"
	make DESTDIR="$pkgdir/" install
}
