# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=hubic-gtk
pkgver=0.5
pkgrel=1
_fossilver=7057635eaa
pkgdesc="An attempt to get a status icon for Hubic on Linux"
arch=('any')
url="http://projects.depar.is/divers/doc/tip/hubic_status/README.md"
license=('custom:WTFPL')
depends=('hubic' 'python2' 'pygtk' 'python2-dbus' 'python2-notify' 'python2-xdg')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::http://projects.depar.is/divers/raw/hubic_status/archlinux/$pkgname-$pkgver.tar.gz?name=$_fossilver)
sha1sums=('7057635eaa61b16473c908c7a47f0dd86c469e7b')

build(){
  cd $srcdir/$pkgname
  make build
}

package() {
  cd $srcdir/$pkgname
  make install DEST=$pkgdir/usr
}

# vim:set ts=2 sw=2 et:
