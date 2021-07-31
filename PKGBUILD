# Maintainer: austomus <austomus.minecraft@gmail.com>
_pkgname=governor-switcher
pkgname=$_pkgname-git
pkgver=1.0
pkgrel=1
pkgdesc="Bash script to change CPU scaling_governor"
arch=('any')
url="https://github.com/i-can-not-program/governor-switcher"
license=('GPL')
groups=()
depends=(bash)
makedepends=(git)
source=("git+https://github.com/i-can-not-program/governor-switcher.git")
md5sums=('SKIP')

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 governor "$pkgdir/usr/bin/governor"
}
