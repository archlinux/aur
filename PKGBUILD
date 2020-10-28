pkgname=executor-data
pkgver=1
pkgrel=2
pkgdesc="Data files for Executor"
arch=('any')
url="http://wiki.victor3d.com.br"
license=('GPL')
source=("$pkgname-$pkgver.tar.gz::https://github.com/victor3dptz/executor-packaging/raw/master/arch/executor.tar.gz")
sha256sums=('7f02071d49634f7b20137cfb58382ab41552414895b839236189fe0586038911')

package() {
	cp -r "${pkgname%-*}/usr" "${pkgdir}"
	cp -r "${pkgname%-*}/opt" "${pkgdir}"
	chmod -R 777 "${pkgdir}/opt"
}
