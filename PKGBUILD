#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=python3-scinum
pkgver=2021
pkgrel=2
pkgdesc='A collection of scientific number classes for arbitrary precision, standard and custom units, and uncertainty for measured values.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/python3-scinum"
depends=(python3)
source=(
  https://xyne.dev/projects/python3-scinum/src/python3-scinum-2021.tar.xz
  https://xyne.dev/projects/python3-scinum/src/python3-scinum-2021.tar.xz.sig
)
sha512sums=(
  936892d5350d8e932bd5a088eb2301adbc470dd34cd2047c1bbea8a43813b8cfbc181b5658e773a7eeda59eaa1e77b982c30b5c5d2210b98cbd0a1b54a561470
  41fc243913f2776d55f7ee1b99e71cfe67d586f82cf84b644d59225ff720ec52c19d31088611aebac882564738810090e03c3b0092900010748e7f65e4218a30
)
md5sums=(
  696ddc2bce66307b8eae534d2f698268
  fbefcf9af5c12e9a779d61e9cd0802f7
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}


# vim: set ts=2 sw=2 et:
