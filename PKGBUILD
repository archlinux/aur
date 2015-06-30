# Maintainer: Yuval Adam <yuv dot adm at gmail dot com> PGP-Key: CC2115C12D99D2F0

pkgname=pfclient
pkgver=2.1.23
pkgrel=1
pkgdesc="Planefinder.net sharing client"
arch=('any')
url="http://planefinder.net/"
license=(unknown)
depends=(nodejs)
source=("http://clientfiles.planefinder.net/pfclient-${pkgver}.tgz") 
sha1sums=('ef84f7adb844286cc5118005b3212f0723aeeffb')

package() {
  cd $srcdir/package
  npm install -g --prefix "$pkgdir/usr"
}

# vim:set ts=2 sw=2 et:
