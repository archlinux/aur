# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>
# Previous maintainer: psycepa <psycepa [at] mail.ru>

pkgname=totalvalidatorbasic
pkgver=11.4.0
pkgrel=1
pkgdesc="(X)HTML validator, an accessibility validator, a spell checker, and a broken links checker"
arch=('any')
url='https://www.totalvalidator.com'
license=('custom')
depends=('java-environment>=7' 'bash')
install='totalvalidatorbasic.install'
source=("https://www.totalvalidator.com/downloads/${pkgname}.tar.gz")
md5sums=('4a3eba7cfda45e3eab4988a58a0e7c4a')
package() {
	cd ${pkgdir}
	mkdir -p ${pkgdir}/opt/${pkgname}
	cp -r ${srcdir}/${pkgname}/* ${pkgdir}/opt/${pkgname}/
	# Install license
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
	cp ${srcdir}/${pkgname}/License.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
