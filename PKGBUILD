# Maintainer: dianlujitao <dianlujitao at gmail dot com>
pkgname=lang-sh
pkgdesc="Scripts from RedHat to set i18n stuff"
pkgver=1.0
pkgrel=1
arch=('any')
url="https://github.com/fedora-sysv/initscripts"
license=('GPL')
depends=('consoletype')
source=("https://raw.githubusercontent.com/fedora-sysv/initscripts/master/lang.sh"
        "https://raw.githubusercontent.com/fedora-sysv/initscripts/master/lang.csh")
sha256sums=('8fe9598bbd0dbefa312815ee87d13aa418f41c61b1ba3f4674d52d41dd38f083'
            '0388bdaf8903bcdc07b908d3f120210c8c0ef6a56ec009509ef1c0fad6a8fede')

package() {
	cd ${srcdir}
	install -Dm644 ${srcdir}/lang.csh ${pkgdir}/etc/profile.d/lang.csh
	install -Dm644 ${srcdir}/lang.sh ${pkgdir}/etc/profile.d/lang.sh
}
