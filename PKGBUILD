# $Id$
# Maintainer: låzaro <uranio-235@riseup.net>

pkgname=cmsimple
pkgver=4.6.1
pkgrel=1
pkgdesc='Very simple CMS for very simple content'
arch=('any')
url='http://cmsimple.org/'
license=('GNU')
depends=('php')
options=('emptydirs')
install="$pkgname.install"
source=("http://www.cmsimple.org/downloads_cmsimple40/CMSimple_$(echo $pkgver |sed s/'\.'/'-'/g).zip")
sha256sums=('8df516551717b413260811855fad28198e2a72599a279c83daadb2a931170631')

package() {
  install -d "$pkgdir/usr/share/webapps"
  cp -r "CMSimple_$(echo $pkgver |sed s/'\.'/'-'/g)" "$pkgdir/usr/share/webapps/cmsimple"
}

# vim:set ts=2 sw=2 et:
