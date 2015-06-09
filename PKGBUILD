# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=xhost-localuser
pkgver=1.0
pkgrel=4
pkgdesc="Add localuser to xhost on login"
arch=(any)
url="https://launchpad.net/ubuntu/+source/xorg"
license=(GPL)
depends=(xorg-xhost)
makedepends=(bzr)
#makedepends=(wget)
source=('bzr+http://bazaar.launchpad.net/~ubuntu-branches/ubuntu/vivid/xorg/vivid/')
sha512sums=('SKIP')

package() {
  install -dm755 "${pkgdir}/etc/X11/xinit/xinitrc.d/"
  install -m755 vivid/debian/local/Xsession.d/60x11-common_localhost \
    "${pkgdir}/etc/X11/xinit/xinitrc.d/"
}
