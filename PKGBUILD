# Maintainer: Victor3D <webmaster@victor3d.com.br>
pkgname=executor-data
pkgver=1
pkgrel=1
pkgdesc="Data files for Executor"
arch=('any')
url="http://wiki.victor3d.com.br"
license=('GPL')
source=("https://github.com/victor3dptz/executor-packaging/raw/master/arch/executor.tar.gz")
md5sums=("868697896b0c51c66d31440f3c59a3fc")

package() {
	cp -r "executor/usr" "${pkgdir}"
	mkdir -p "${pkgdir}/usr/share/executor/home"
	chmod -R 777 "${pkgdir}/usr/share/executor/home"
}
