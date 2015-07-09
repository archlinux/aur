# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: xavi <marcosiviero.mobile@gmail.com>
pkgname=absolute-theme
pkgver=0.1
pkgrel=2
pkgdesc="A light fluxbox theme that fits well with absolute gtk theme"
arch=('any')
url="http://www.neogrigio.t15.org/"
license=('GPL')
source=("theme.cfg")
md5sums=('ad55a5a6a77b3c3258821e8f1459cf7c')

package() {
  install -D -m775 $srcdir/theme.cfg $pkgdir/usr/share/fluxbox/styles/$pkgname/theme.cfg
}
