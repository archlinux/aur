# Maintainer: Luis Gustavo S. Barreto <gustavosbarreto@gmail.com>

pkgname=activecollab5-timer
pkgver=1.5.1
pkgrel=1
pkgdesc="activeCollab Timer tracks time on your desktop computer and lets you easily submit it to activeCollab via activeCollab API. "
arch=('x86_64')
url="https://timer.activecollab.com/"
license=('unknown')
depends=(gtk2)
makedepends=(dpkg)
options=(!strip)
source=(https://timer.activecollab.com/downloads/linux/activecollab-timer.deb)
md5sums=(c35d26a30dd6b7c57f9dc51a02b1b582)

prepare() {
    dpkg-deb -x activecollab-timer.deb ${srcdir}
}

package() {
    cp -rf ${srcdir}/* ${pkgdir}
}
