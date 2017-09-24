# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=gcc6-gcj-compat
pkgver=6.4.0
pkgrel=2
pkgdesc="wapper package for gcc6-gcj to gcc-gcj compatability"
arch=('i686' 'x86_64')
license=('GPL')
url="https://aur.archlinux.org/gcc6-gcj-compat"
depends=("gcc6-gcj=$pkgver" 'classpath')
provides=("gcc-gcj=$pkgver")
conflicts=("gcc-gcj")
source=()

package() {
  _gcjver=6

  mkdir -p "$pkgdir/usr/bin"
  ln -s aot-compile-${_gcjver} "$pkgdir/usr/bin/aot-compile"
  ln -s gappletviewer-${_gcjver} "$pkgdir/usr/bin/gappletviewer"
  ln -s gc-analyze-${_gcjver} "$pkgdir/usr/bin/gc-analyze"
  ln -s gcj-${_gcjver} "$pkgdir/usr/bin/gcj"
  ln -s gcj-dbtool-${_gcjver} "$pkgdir/usr/bin/gcj-dbtool"
  ln -s gcjh-${_gcjver} "$pkgdir/usr/bin/gcjh"
  ln -s gij-${_gcjver} "$pkgdir/usr/bin/gij"
  ln -s gjar-${_gcjver} "$pkgdir/usr/bin/gjar"
  ln -s gjarsigner-${_gcjver} "$pkgdir/usr/bin/gjarsigner"
  ln -s gjavah-${_gcjver} "$pkgdir/usr/bin/gjavah"
  ln -s gkeytool-${_gcjver} "$pkgdir/usr/bin/gkeytool"
  ln -s gnative2ascii-${_gcjver} "$pkgdir/usr/bin/gnative2ascii"
  ln -s gorbd-${_gcjver} "$pkgdir/usr/bin/gorbd"
  ln -s grmic-${_gcjver} "$pkgdir/usr/bin/grmic"
  ln -s grmid-${_gcjver} "$pkgdir/usr/bin/grmid"
  ln -s grmiregistry-${_gcjver} "$pkgdir/usr/bin/grmiregistry"
  ln -s gserialver-${_gcjver} "$pkgdir/usr/bin/gserialver"
  ln -s gtnameserv-${_gcjver} "$pkgdir/usr/bin/gtnameserv"
  ln -s jcf-dump-${_gcjver} "$pkgdir/usr/bin/jcf-dump"
  ln -s jv-convert-${_gcjver} "$pkgdir/usr/bin/jv-convert"
  ln -s rebuild-gcj-db-${_gcjver} "$pkgdir/usr/bin/rebuild-gcj-db"
  ln -s $CARCH-pc-linux-gnu-gcj-${_gcjver} "$pkgdir/usr/bin/$CARCH-pc-linux-gnu-gcj"

  mkdir -p "$pkgdir/usr/share/man/man1"
  ln -s aot-compile-${_gcjver}.1.gz "$pkgdir/usr/share/man/man1/aot-compile.1.gz"
  ln -s gappletviewer-${_gcjver}.1.gz "$pkgdir/usr/share/man/man1/gappletviewer.1.gz"
  ln -s gc-analyze-${_gcjver}.1.gz "$pkgdir/usr/share/man/man1/gc-analyze.1.gz"
  ln -s gcj-${_gcjver}.1.gz "$pkgdir/usr/share/man/man1/gcj.1.gz"
  ln -s gcj-dbtool-${_gcjver}.1.gz "$pkgdir/usr/share/man/man1/gcj-dbtool.1.gz"
  ln -s gcjh-${_gcjver}.1.gz "$pkgdir/usr/share/man/man1/gcjh.1.gz"
  ln -s gij-${_gcjver}.1.gz "$pkgdir/usr/share/man/man1/gij.1.gz"
  ln -s gjar-${_gcjver}.1.gz "$pkgdir/usr/share/man/man1/gjar.1.gz"
  ln -s gjarsigner-${_gcjver}.1.gz "$pkgdir/usr/share/man/man1/gjarsigner.1.gz"
  ln -s gjavah-${_gcjver}.1.gz "$pkgdir/usr/share/man/man1/gjavah.1.gz"
# ln -s gjdoc-${_gcjver}.1.gz "$pkgdir/usr/share/man/man1/gjdoc.1.gz"
  ln -s gkeytool-${_gcjver}.1.gz "$pkgdir/usr/share/man/man1/gkeytool.1.gz"
  ln -s gnative2ascii-${_gcjver}.1.gz "$pkgdir/usr/share/man/man1/gnative2ascii.1.gz"
  ln -s gorbd-${_gcjver}.1.gz "$pkgdir/usr/share/man/man1/gorbd.1.gz"
  ln -s grmic-${_gcjver}.1.gz "$pkgdir/usr/share/man/man1/grmic.1.gz"
  ln -s grmid-${_gcjver}.1.gz "$pkgdir/usr/share/man/man1/grmid.1.gz"
  ln -s grmiregistry-${_gcjver}.1.gz "$pkgdir/usr/share/man/man1/grmiregistry.1.gz"
  ln -s gserialver-${_gcjver}.1.gz "$pkgdir/usr/share/man/man1/gserialver.1.gz"
  ln -s gtnameserv-${_gcjver}.1.gz "$pkgdir/usr/share/man/man1/gtnameserv.1.gz"
  ln -s jcf-dump-${_gcjver}.1.gz "$pkgdir/usr/share/man/man1/jcf-dump.1.gz"
  ln -s jv-convert-${_gcjver}.1.gz "$pkgdir/usr/share/man/man1/jv-convert.1.gz"
  ln -s rebuild-gcj-db-${_gcjver}.1.gz "$pkgdir/usr/share/man/man1/rebuild-gcj-db.1.gz"
}


# vim:set ts=2 sw=2 et:
