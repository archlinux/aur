pkgname=gcccpuopt
pkgver=0.99.14
pkgrel=1
pkgdesc="Prints the GCC CPU-specific options tailored for the current CPU."
arch=('any')
license=('GPL')
url="http://www.pixelbeat.org/"
source=("$pkgname-$pkgver.sh::https://raw.github.com/pixelb/scripts/master/scripts/gcccpuopt")
sha256sums=('c50a35cd88825e66154823c1807cb5a28db36498286155c56fcbb09391c5c336')
depends=(bash)

package() {
	install -D -m775 $srcdir/$pkgname-$pkgver.sh $pkgdir/usr/bin/$pkgname
}
