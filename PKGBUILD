# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>
# Previous maintainer: psycepa <psycepa [at] mail.ru>

pkgname=totalvalidatorbasic
pkgver=8.7.0
pkgrel=2
pkgdesc="(X)HTML validator, an accessibility validator, a spell checker, and a broken links checker"
arch=('i686' 'x86_64')
url='https://www.totalvalidator.com'
license=('custom')
depends=('java-runtime')
install='totalvalidatorbasic.install'
source=("https://www.totalvalidator.com/downloads/${pkgname}.tar.gz")
md5sums=('80a9df716876ee87dda39bce94bffd6d')
package() {
	cd ${pkgdir}
	mkdir -p ${pkgdir}/opt/${pkgname}
	cp -r ${srcdir}/${pkgname}/* ${pkgdir}/opt/${pkgname}/
	# Install license
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
	cp ${srcdir}/${pkgname}/License.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
