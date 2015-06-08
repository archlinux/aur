# Maintainer: Dominik Heidler <dheidler@gmail.com>

pkgname=scat
pkgver=0.1
pkgrel=3
pkgdesc="Syntax highlight on the terminal"
arch=(any)
url="https://github.com/asdil12/scat"
license=('GPL')
groups=()
provides=()
depends=('pygmentize')
makedepends=('git')

source=("git://github.com/asdil12/scat.git")
md5sums=('SKIP')

package() {
	cd $srcdir/$pkgname
	install -D -m755 ./scat $pkgdir/usr/bin/scat
}
