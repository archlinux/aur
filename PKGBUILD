# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=ob-autostart
pkgver=1
pkgrel=3
pkgdesc="A simple autostart application for Openbox"
arch=('any')
url="http://crunchbanglinux.org/forums/topic/2614/"
license=('GPL2')
depends=('python'  'pygtk')
#optdepends=('python-notify')
source=('ob-autostart') #from http://www.ad-comp.be/public/projets/ob-autostart/ob-autostart
md5sums=('7e19c8d8c02f296e7235e2dbe31b7b00')

package() {
  install -D -m755 "${srcdir}/ob-autostart" "${pkgdir}/usr/bin/ob-autostart"
}
