# Maintainer: Watcharapol Tadtiang <7aborigines7@gmail.com>
# Contributor: Jacob Vlijm <vlijm@planet.nl>
pkgname=takeabreak
pkgver=0.5.3
pkgrel=1
pkgdesc="Take a Break"
arch=('i686' 'x86_64')
license=('AGPL3')
depends=('python' 'wmctrl' 'xprintidle' 'notify-osd')
url=(https://launchpad.net/takeabreak)
source=(http://ppa.launchpad.net/vlijm/takeabreak/ubuntu/pool/main/t/takeabreak/takeabreak_$pkgver.orig.tar.gz)

md5sums=('d0f2be28d5e543e9ccbc64827e2d21db')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -D docs/about $pkgdir/opt/takeabreak/docs/about
  install -D icon/break_64.png $pkgdir/opt/takeabreak/icon/break_64.png
  install -D code/takeabreak $pkgdir/opt/takeabreak/takeabreak/takeabreak
  install -D code/takeabreak_run $pkgdir/opt/takeabreak/takeabreak/takeabreak_run
  install -D code/message_window $pkgdir/opt/takeabreak/takeabreak/message_window
  install -D miscellaneous/extras-takeabreak.desktop $pkgdir/usr/share/applications/extras-takeabreak.desktop
  install -D manpages/takeabreak.1 $pkgdir/usr/share/man/man1
}