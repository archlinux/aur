pkgname=gcccpuopt
pkgver=0.99.14
pkgrel=2
pkgdesc="Prints the GCC CPU-specific options tailored for the current CPU."
arch=('any')
license=('GPL')
url="http://www.pixelbeat.org/"
source=("$pkgname-$pkgver.sh::https://raw.github.com/pixelb/scripts/master/scripts/gcccpuopt")
sha256sums=('f6ec88d653e27113f21f99af82408e8683a9cbd4e91fc2a56b245dab66ff3e55')
depends=(bash)

package() {
	install -D -m775 $srcdir/$pkgname-$pkgver.sh $pkgdir/usr/bin/$pkgname
}
