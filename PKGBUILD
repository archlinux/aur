# $Id: PKGBUILD,v 1.14 2008/02/01 04:26:49 kevin Exp $
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Maintainer: Kevin Piche <kevin@archlinux.org>

pkgname=gob2
pkgver=2.0.15
pkgrel=1
pkgdesc="GTK Object Builder (GOB) is a simple preprocessor for easily creating GTK objects"
arch=(i686 x86_64)
license=('GPL')
depends=('glib2')
source=(http://ftp.5z.com/pub/gob/${pkgname}-${pkgver}.tar.gz)
url="http://www.5z.com/jirka/gob.html"
md5sums=('0c5ab18305fc37902d202a253fdb28b1')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
