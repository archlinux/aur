pkgname=executor-data
pkgver=1
pkgrel=2
pkgdesc="Data files for Executor"
arch=('any')
url="http://wiki.victor3d.com.br"
license=('GPL')
source=("$pkgname-$pkgver.tar.gz::https://github.com/victor3dptz/executor-packaging/raw/master/arch/executor.tar.gz")
sha256sums=('e6327cc599c1e05a8db4438f15bde519040d3c38fe2c63a250f08698de4ddd42')

package() {
	cp -r "${pkgname%-*}/usr" "${pkgdir}"
	cp -r "${pkgname%-*}/opt" "${pkgdir}"
	chmod -R 777 "${pkgdir}/opt/executor/"
}
