# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>
# Previous maintainer: psycepa <psycepa [at] mail.ru>

pkgname=totalvalidatorbasic
pkgver=11.8.0
pkgrel=2
pkgdesc="(X)HTML validator, an accessibility validator, a spell checker, and a broken links checker"
arch=('any')
url='https://www.totalvalidator.com'
license=('custom')
depends=('java-environment>=7' 'bash')
install='totalvalidatorbasic.install'
source=("https://www.totalvalidator.com/downloads/${pkgname}.tar.gz")
md5sums=('7c886e6ece5e8c88ca63ae9de2947e55')
package() {
	cd ${pkgdir}
	mkdir -p ${pkgdir}/opt/${pkgname}
	cp -r ${srcdir}/${pkgname}/* ${pkgdir}/opt/${pkgname}/
	# Install license
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
	cp ${srcdir}/${pkgname}/Licence.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
