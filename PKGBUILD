#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=python3-tabulator
pkgver=2021
pkgrel=15
pkgdesc='A table formatter class with support for a variety of outputs.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/python3-tabulator"
depends=(python3)
makedepends=(python-setuptools)
source=(
  https://xyne.dev/projects/python3-tabulator/src/python3-tabulator-2021.tar.xz
  https://xyne.dev/projects/python3-tabulator/src/python3-tabulator-2021.tar.xz.sig
)
sha512sums=(
  a9b42a4ca76ff91fad7429c5a51a6a86cc6186bdcc422a7208ec3ea20b693e9565aaa6b61c3d932b904be0db378d682bd99b72eb8262e2dee15b156ab73b6a75
  69635313e33e5ec00fb7cfd484ef29c75e6d00a40d9151c3f220c263010994c2bf10b491766131ee95705728566a913d2780f03b65c30f64168f10c984fcf8c9
)
md5sums=(
  d201583c52303e8a0e999097b2fe8dce
  70e31a03380e3afe1cc8bb594219dc0b
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}


# vim: set ts=2 sw=2 et:
