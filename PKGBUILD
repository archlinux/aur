#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=pacman2aria2
pkgver=2012
pkgrel=5
pkgdesc='Convert pacman download URL lists to reflector-augmented aria2c input lists. Includes powerpill-light.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/pacman2aria2"
depends=(aria2 python3 'reflector>=2011.04.04')
source=(
  https://xyne.dev/projects/pacman2aria2/src/pacman2aria2-2012.tar.xz
  https://xyne.dev/projects/pacman2aria2/src/pacman2aria2-2012.tar.xz.sig
)
sha512sums=(
  f04f753db891bd5745fb30f6bd832a811c135f658718944d609108f0d972b7809d5b90c9fcd6a0e16fee8a47f6ad8c2594bde85eb3186fe510fdf638a85b36cb
  0c31d3246e624729c3b5315f352e67bfa37363a003fdacccb755adc4ebeaa74c4a860b211f167967d7ba4b048bcd6079025a5525a0065e9397a289fbef0bf372
)
md5sums=(
  5b6afbebf4d1aec1e570c1c02540c162
  04686916ecdcedcea509d3b275b0cde3
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "$srcdir/$pkgname-$pkgver/powerpill-light" "$pkgdir/usr/bin/powerpill-light"
}


# vim: set ts=2 sw=2 et:
