# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: dany <dany12@archlinux.us>
pkgname=setpppoe
pkgver=1.0
pkgrel=2
pkgdesc="GUI tool to manage one or more PPPoE connections"
arch=('any')
url="http://code.google.com/p/setpppoe-gui/"
license=('GPL3')
depends=('zenity' 'net-tools' 'gksu')
source=(http://setpppoe-gui.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('bb1c31ade642f70e3e2a0c25b6beac17')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 usr/share/pixmaps/${pkgname}.png \
      "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm755 usr/sbin/${pkgname} \
      "${pkgdir}/usr/sbin/${pkgname}"
  install -Dm644 usr/share/applications/${pkgname}.desktop \
      "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 usr/share/${pkgname}/english \
      "${pkgdir}/usr/share/${pkgname}/english"
  install -Dm644 usr/share/${pkgname}/srpski \
      "${pkgdir}/usr/share/${pkgname}/srpski"
  install -Dm644 usr/share/doc/${pkgname}/english \
      "${pkgdir}/usr/share/doc/${pkgname}/english"
  install -Dm644 usr/share/doc/${pkgname}/srpski \
      "${pkgdir}/usr/share/doc/${pkgname}/srpski"
  install -Dm644 etc/${pkgname}.conf \
      "${pkgdir}/etc/${pkgname}.conf"
}

# vim:set ts=2 sw=2 et:


