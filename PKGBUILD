pkgname=gcccpuopt
pkgver=0.99.12
pkgrel=2
pkgdesc="Prints the GCC CPU-specific options tailored for the current CPU."
arch=('any')
license=('GPL')
url="http://www.pixelbeat.org/"
source=("https://raw.github.com/pixelb/scripts/master/scripts/gcccpuopt")
sha256sums=('ca67106f008b2f22bc4cf6565ae15b1159f71fb417c1fe581f72ac6a7a0dac51')

package() {
	install -D -m775 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
}
