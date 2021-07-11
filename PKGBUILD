# Maintainer: Ashwini Sahu <ashwinisahu990@gmail.com>

pkgname="app-manager"
pkgver="1.0"
pkgrel="1"
pkgdesc="Manage Android application in Linux (CLI)"
arch=('any')
url="https://github.com/ASHWIN990/app-manager"
license=('GPL3')
depends=('android-tools')
provides=('app-manager')
source=("git+https://github.com/ASHWIN990/app-manager.git")
md5sums=('SKIP')

package() {
	cd "$srcdir/${pkgname}"
	install -Dm775 app-manager -t ${pkgdir}/usr/bin/
}
