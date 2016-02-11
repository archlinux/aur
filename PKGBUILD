# Maintainer: zoe <chp321 AT gmail DOT com>

pkgname=tv_grab_fr_telerama
pkgver=1.20
pkgrel=1
pkgdesc="Grab TV listings for France, from guidetv-iphone.telerama.fr"
arch=(any)
url="https://github.com/ybonnel/ybo-tv-xmltv/blob/master/${pkgname}"
license=("GPL")
depends=('xmltv')
source=(https://raw.githubusercontent.com/ybonnel/ybo-tv-xmltv/master/${pkgname})
md5sums=('02fd2a61c373e540e446d0c9b683afea')

package() {
  mkdir -p $pkgdir/usr/bin/vendor_perl/
  install -D -m 0755 $srcdir/${pkgname} \
		     $pkgdir/usr/bin/vendor_perl/${pkgname}
}
