# Maintainer: Microeinstein <mu ddoott emc2 ddoott flower at inventati ddoott org>

pkgname=java-wrappers
pkgver=1.0
pkgrel=1
pkgdesc="Create a launch wrapper for each installed Java version"
arch=(any)
url=""
license=('GPL')
install=pkg.install
depends=(bash file)
source=(java-wrappers.hook
        java-wrappers)
md5sums=('a24bf225b693b152590da95dcc62115f'
         'ec3d6dca00ffc7744f3cfce53a6e4a39')

package() {
	cd "$srcdir"
	local p="$pkgdir/usr/lib/libalpm"
	mkdir -p "$p/"{scripts,hooks}
	install -m 755 {,"$p/scripts/"}java-wrappers
	install -m 644 {,"$p/hooks/"}java-wrappers.hook
}
