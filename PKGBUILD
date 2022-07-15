#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=pychrom
pkgver=2012
pkgrel=6
pkgdesc='An enhanced yet simple pyGTK color selection and conversion tool that can minimize to the tray.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/pychrom"
depends=(gtk2 pygtk python2)
source=(
  https://xyne.dev/projects/pychrom/src/pychrom-2012.tar.xz
  https://xyne.dev/projects/pychrom/src/pychrom-2012.tar.xz.sig
)
sha512sums=(
  d055aa34f62cbb00367bde2dd22f5016ad571e4c70c7fca597bb253a93197ef7facbdebf7cd1e2f099761207080694625645f88086b584b6b56c58cd10eaf651
  4daea37d701b6c7cc77e3496553450bf5f1c2144531d6af5af2ce0f651f7af9d26f6cba0947018a4defd088f296dd9d7220b296a2b205aaead488304e04331de
)
md5sums=(
  c10d0c91f73d0221d719bd9b4d531a12
  52d2b59368a52a2973a6a0d6a461496c
)
install=pychrom.install
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname";
  install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}


# vim: set ts=2 sw=2 et:
