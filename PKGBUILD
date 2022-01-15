# Maintainer: Ali Nabipour <alinabipour01@gmail.com>

pkgname=cutefish-cursor-themes-git
_pkgname=cutefish-cursor-themes
pkgver=0.7
pkgrel=1
pkgdesc="Cutefish cursor dark/light themes"
arch=('any')
url="https://github.com/cutefishos/cursor-themes"
license=('GPL')
groups=('cutefish-git')
depends=()
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha512sums=('SKIP')

# pkgver() {
#   cd cursor-themes
#   git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
# }

package() {
  cd cursor-themes
	install -d "$pkgdir/usr/share/icons"
	cp -r cutefish-dark cutefish-light "$pkgdir/usr/share/icons"
}