# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=vncviewer-jar
pkgver=1.3.10
pkgrel=4
pkgdesc="VNC viewer java applet"
arch=('any')
license=('GPL')
url="http://www.tightvnc.com"
conflicts=('tightvnc')
options=('!makeflags')
source=(http://downloads.sf.net/sourceforge/vnc-tight/tightvnc-${pkgver}_unixsrc.tar.bz2)
md5sums=('397b35faad32d5246b6d44b142f8304f')

package() {
  cd "$srcdir"/vnc_unixsrc
  mkdir -p "$pkgdir"/usr/share/vnc/classes
  install -D -m644 "$srcdir"/vnc_unixsrc/classes/* \
	"$pkgdir"/usr/share/vnc/classes
}
