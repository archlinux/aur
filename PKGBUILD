# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>
# Previous maintainer: psycepa <psycepa [at] mail.ru>

pkgname=totalvalidatorbasic
pkgver=10.0.1
pkgrel=1
pkgdesc="(X)HTML validator, an accessibility validator, a spell checker, and a broken links checker"
arch=('any')
url='https://www.totalvalidator.com'
license=('custom')
depends=('java-environment' 'bash')
install='totalvalidatorbasic.install'
source=("https://www.totalvalidator.com/downloads/${pkgname}.tar.gz")
md5sums=('82492fcf4bf6986dd0435e75dcf3c9b3')
package() {
	cd ${pkgdir}
	mkdir -p ${pkgdir}/opt/${pkgname}
	cp -r ${srcdir}/${pkgname}/* ${pkgdir}/opt/${pkgname}/
	# Install license
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
	cp ${srcdir}/${pkgname}/License.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
