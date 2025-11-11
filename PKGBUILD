# Maintainer: Srikar <zeltronsrikar@gmail.com>
# Contributor: kaptoxic@yahoo.com
# Contributor: Jaime Gil de Sagredo <jaimegildesagredo@gmail.com>

pkgname=checkstyle-bin
pkgrel=1
pkgver=12.1.2
pkgdesc='Java source code linter'
arch=('any')
url='https://github.com/checkstyle/checkstyle'
license=('LGPL-2.1-only')
depends=('java-runtime>=11')
source=("checkstyle.jar::https://github.com/checkstyle/checkstyle/releases/download/checkstyle-${pkgver}/checkstyle-${pkgver}-all.jar"
	'checkstyle')
sha512sums=('SKIP'
	'SKIP')
conflicts=('checkstyle')

package() {
	install -Dm644 "${srcdir}/checkstyle.jar" "${pkgdir}/usr/share/java/checkstyle/checkstyle.jar"
	install -Dm755 "${srcdir}/checkstyle" "${pkgdir}/usr/bin/checkstyle"
}
