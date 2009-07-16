# $Id: PKGBUILD,v 1.5 2009/02/05 12:23:03 abhidg Exp $
# Maintainer : Tom Killian <tom@archlinux.org>
# Contributor: Nikos Kouremenos (zeppelin) kourem at gmail dot com

pkgname=autocutsel
pkgver=0.9.0
pkgrel=2
pkgdesc="synchronizes the two copy/paste buffers mainly used by X applications"
arch=('i686' 'x86_64')
depends=('libxaw')
source=(http://lepton.fr/tools/autocutsel/autocutsel-$pkgver.tar.gz)
md5sums=('ba4a6f632cb4815ae4e5c3027c24cfc5')
url="http://lepton.fr/tools/autocutsel/"
license=('GPL')
build()
{
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
