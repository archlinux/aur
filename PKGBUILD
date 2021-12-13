#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=python3-tabulator
pkgver=2021
pkgrel=2
pkgdesc='A table formatter class with support for a variety of outputs.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/python3-tabulator"
depends=(python3)
source=(
  https://xyne.dev/projects/python3-tabulator/src/python3-tabulator-2021.tar.xz
  https://xyne.dev/projects/python3-tabulator/src/python3-tabulator-2021.tar.xz.sig
)
sha512sums=(
  a9b42a4ca76ff91fad7429c5a51a6a86cc6186bdcc422a7208ec3ea20b693e9565aaa6b61c3d932b904be0db378d682bd99b72eb8262e2dee15b156ab73b6a75
  c6b6a99ccee40cdffbf7fb45a7582dc54767dcd751833f15afb9dcad7180b64408d2c65933db2402b2644dab29c44fd4fb0fa11b56d6ab7f9cfb6371e40345ca
)
md5sums=(
  d201583c52303e8a0e999097b2fe8dce
  c8531d84e47ff5b3b8580c701158e691
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}


# vim: set ts=2 sw=2 et:
