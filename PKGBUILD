# Maintainer: Luis Gustavo S. Barreto <gustavosbarreto@gmail.com>

pkgname=activecollab5-timer
pkgver=1.6.81
pkgrel=1
pkgdesc="activeCollab Timer tracks time on your desktop computer and lets you easily submit it to activeCollab via activeCollab API. "
arch=('x86_64')
url="https://timer.activecollab.com/"
license=('unknown')
depends=(gtk2)
makedepends=(dpkg)
options=(!strip)
source=(https://timer.activecollab.com/downloads/linux/current/activecollab-timer.deb)
md5sums=(7cb159778847529fc0bf6588835643ab)

prepare() {
    dpkg-deb -x activecollab-timer.deb ${srcdir}
}

package() {
    cp -rf ${srcdir}/* ${pkgdir}
}
