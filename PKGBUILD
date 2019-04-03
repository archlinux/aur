# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=fvwm-crystal
pkgver=3.4.1
pkgrel=3
pkgdesc="Transparent Themes for fvwm"
arch=('any')
url="http://fvwm-crystal.sourceforge.net/"
license=('GPL')
depends=('fvwm' 'imagemagick' 'feh' 'trayer' 'xdg-user-dirs' 'python2')
options=('!makeflags')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha1sums=('afa5a8a2dbc0454c0809ed46a04cea7d17420fb0')

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" prefix=/usr install
}
