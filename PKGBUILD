pkgname=executor-data
pkgver=1
pkgrel=2
pkgdesc="Data files for Executor"
arch=('any')
url="http://wiki.victor3d.com.br"
license=('GPL')
source=("$pkgname-$pkgver.tar.gz::https://github.com/victor3dptz/executor-packaging/raw/master/arch/executor.tar.gz")
sha256sums=('2a80bfe8c0501b8278eca43f3a46761eebea317c04f6a019a980a1995ffaf4d6')

package() {
	cp -r "${pkgname%-*}/usr" "${pkgdir}"
	cp -r "${pkgname%-*}/opt" "${pkgdir}"
	chmod -R 777 "${pkgdir}/opt/executor/"
}
