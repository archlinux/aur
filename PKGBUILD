#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=cups-client-mgr
pkgver=2013
pkgrel=4
pkgdesc='Save and restore CUPS client states.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/cups-client-mgr"
depends=(bash-statemgr)
source=(
  https://xyne.dev/projects/cups-client-mgr/src/cups-client-mgr-2013.tar.xz
  https://xyne.dev/projects/cups-client-mgr/src/cups-client-mgr-2013.tar.xz.sig
)
sha512sums=(
  d90de376a27bce254f2130d92f334fa8f983e315f62d06e86d936c9579c6b776ac980d2ae75a310c244bcd9660732a1c272b2b577db30fbd4286b8b0c1fa8e9a
  410ce85ad99c7621adf2005ce2433fc48d9b60bf944f893a2f923ebc56e49d41a1464d989c3fdba41c4acf4c0f8f3113958987f9279b552169684714088e1291
)
md5sums=(
  519dec6d2c2962fa94837085bbaa34c1
  06fceef640760322fa270999a1ce6f09
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
