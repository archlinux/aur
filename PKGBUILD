# Maintainer:  <a.c.kalker@gmail.com>
pkgname=sound-icons
pkgver=0.1
pkgrel=1
pkgdesc="a collection of Sound Icons for speech-dispatcher"
arch=('any')
url="http://www.freebsoft.org/"
license=('GPL')
source=(http://www.freebsoft.org/pub/projects/sound-icons/sound-icons-0.1.tar.gz)
md5sums=('2777d1ec18854230dce51fb75490c26e')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -dm755 "${pkgdir}"/usr/share/sounds/sound-icons
  cp -a ./* "${pkgdir}"/usr/share/sounds/sound-icons/
  chmod 755 "${pkgdir}"/usr/share/sounds/sound-icons/README
  rm "${pkgdir}"/usr/share/sounds/sound-icons/COPYING
}

# vim:set ts=2 sw=2 et:
