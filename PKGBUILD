#! /bin/bash
# Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Jeremy Sands <cto@jeremysands.com>

pkgname=opera-adblock-complete
pkgver=11.05.2013
pkgrel=1
pkgdesc="Fanboy's AdBlock Filterset for Opera including Stat/Tracking Filters"
arch=('any')
url="http://www.fanboy.co.nz/adblock/opera/"
license=('cc-by-3.0')
depends=('opera')
source=(http://www.fanboy.co.nz/adblock/opera/urlfilter.ini)
install=${pkgname}.install
sha512sums=('47ef0c7e195f6fcfad1ca7fa7dd8149a2fd3de98680a6da38c45925f4e1a6d5a6dc448d5a6a866e0517a8be95d49d708f9583a5bbb102fa88956f7e519f254dd')


package() {
  cd $srcdir
  install -D -m644 urlfilter.ini $pkgdir/usr/share/$pkgname/urlfilter.ini
}

# vim:set ts=2 sw=2 et: