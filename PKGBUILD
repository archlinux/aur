pkgname=executor-data
pkgver=1
pkgrel=2
pkgdesc="Data files for Executor"
arch=('any')
url="http://wiki.victor3d.com.br"
license=('GPL')
source=("$pkgname-$pkgver.tar.gz::https://github.com/victor3dptz/executor-packaging/raw/master/arch/executor.tar.gz")
sha256sums=('34bcb0a41fcdf55d72020bd0446af0b29fbde1ac0de1cf50013b1d885775788b')

package() {
	cp -r "${pkgname%-*}/usr" "${pkgdir}"
	cp -r "${pkgname%-*}/opt" "${pkgdir}"
	chmod -R 777 "${pkgdir}/opt/executor/"
}
