#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=unibrow
pkgver=2012.12
pkgrel=3
pkgdesc='A unicode character browser that sits in the tray.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/unibrow"
depends=(python2 pygtk gtk2)
source=(
  http://xyne.archlinux.ca/projects/unibrow/src/unibrow-2012.12.tar.xz
  http://xyne.archlinux.ca/projects/unibrow/src/unibrow-2012.12.tar.xz.sig
)
sha512sums=(
  a818157d6f31a312f7ef6de32b830fbc634552becccc77cff89f71566465f6538436aae6b6951ca9ae68d69a104fafe37893c204c1a7919baad6ee13e9634cc0
  0990d16320a214a8842389b30e11c5ca0bfa88ce9156cc007346ea05bc86a7ac1a497c18055b554cb747f7639f84555b8b367d511954e41af416ea8693fb183d
)
md5sums=(
  317d88af0c35e744191c0b4792fc0a91
  62c39193d43ebf3372ceb03cd73f6169
)
install=unibrow.install
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}


# vim: set ts=2 sw=2 et:
