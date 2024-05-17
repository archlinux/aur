#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=python3-scinum
pkgver=2021
pkgrel=15
pkgdesc='A collection of scientific number classes for arbitrary precision, standard and custom units, and uncertainty for measured values.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/python3-scinum"
depends=(python3)
makedepends=(python-setuptools)
source=(
  https://xyne.dev/projects/python3-scinum/src/python3-scinum-2021.tar.xz
  https://xyne.dev/projects/python3-scinum/src/python3-scinum-2021.tar.xz.sig
)
sha512sums=(
  936892d5350d8e932bd5a088eb2301adbc470dd34cd2047c1bbea8a43813b8cfbc181b5658e773a7eeda59eaa1e77b982c30b5c5d2210b98cbd0a1b54a561470
  10eca9f3dfb39d19ac789cfe9216e924ddf4c31711bee49f9975a6584a3fdc5884838030caf5bb15ceb53b50822ca99f40ba6ce712930d863bc0d5cba7adeb36
)
md5sums=(
  696ddc2bce66307b8eae534d2f698268
  aa40ed2c98f553a89cd90a01000c92c0
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}


# vim: set ts=2 sw=2 et:
