#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=unibrow
pkgver=2012.12
pkgrel=6
pkgdesc='A unicode character browser that sits in the tray.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/unibrow"
depends=(gtk2 pygtk python2)
source=(
  https://xyne.dev/projects/unibrow/src/unibrow-2012.12.tar.xz
  https://xyne.dev/projects/unibrow/src/unibrow-2012.12.tar.xz.sig
)
sha512sums=(
  a818157d6f31a312f7ef6de32b830fbc634552becccc77cff89f71566465f6538436aae6b6951ca9ae68d69a104fafe37893c204c1a7919baad6ee13e9634cc0
  f06a72075e6e15bb5cac6f84541c74b73c98e00717d029b92fd9b81bf1ba39ff96be99493aab5cb8665017eebac82869294a34cfe04a03b9c1e117b6f8a4727b
)
md5sums=(
  317d88af0c35e744191c0b4792fc0a91
  eb671e8adc434c0c6c81fab031753934
)
install=unibrow.install
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}


# vim: set ts=2 sw=2 et:
