#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=rmdupes
pkgver=2017.3.5
pkgrel=1
pkgdesc='Command-line tool to find and remove duplicate files.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/rmdupes"
depends=(python3)
source=(
  http://xyne.archlinux.ca/projects/rmdupes/src/rmdupes-2017.3.5.tar.xz
  http://xyne.archlinux.ca/projects/rmdupes/src/rmdupes-2017.3.5.tar.xz.sig
)
sha512sums=(
  3777f6e24b25b1bef2218b2bd831e7f18cf3b104446cc3f79fc5b15474df15cd295f97c00eac322eb91202cc1a930510f1ae5f5110d58b0ac680b6b404d5d9d3
  06370c9f646c63877e948a8ddc9e4ca61d0edf3564566d9b2c639ecbfd48740c981559764c87ea9e44f2b7a9ea2d8420bc0f4556c55f1c8b1fa1fd44887fb967
)
md5sums=(
  9a311cd725e582dd70295658a71bdceb
  b51e2231b4fae2e4100721eaf7a6291c
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
