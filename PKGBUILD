#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pychrom
pkgver=2012
pkgrel=3
pkgdesc='An enhanced yet simple pyGTK color selection and conversion tool that can minimize to the tray.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/pychrom"
depends=(python2 pygtk gtk2)
source=(
  http://xyne.archlinux.ca/projects/pychrom/src/pychrom-2012.tar.xz
  http://xyne.archlinux.ca/projects/pychrom/src/pychrom-2012.tar.xz.sig
)
sha512sums=(
  d055aa34f62cbb00367bde2dd22f5016ad571e4c70c7fca597bb253a93197ef7facbdebf7cd1e2f099761207080694625645f88086b584b6b56c58cd10eaf651
  db19afb09bec9a958697bdab58e95e53275a5b64bea83c4097c0fa93fb1051a77c4236f74c712cf0aea908c59ee341d0bfe2865775b2dad6433a0c1eca87cfad
)
md5sums=(
  c10d0c91f73d0221d719bd9b4d531a12
  cd791e704a1f0db262ced591225a193c
)
install=pychrom.install
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname";
  install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}


# vim: set ts=2 sw=2 et:
