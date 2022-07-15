#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=recollect
pkgver=2013.10.6
pkgrel=4
pkgdesc='Keep local copies of remote files updated.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/recollect"
depends=(python3)
source=(
  https://xyne.dev/projects/recollect/src/recollect-2013.10.6.tar.xz
  https://xyne.dev/projects/recollect/src/recollect-2013.10.6.tar.xz.sig
)
sha512sums=(
  50485c2767f7770036c13a233c87609d0f36862a790a8c9113400ce6b7414b2327bd21395d593f1bbfac9f98ae369f1c460e860b83deeb676b12e69ce06897a1
  c5284b5ba27df9a2ab3d99554b73b28850f3f7c67af850f80f3d0441d6e861bf3b3198c6b1b92fd96e6e193e954a26662d339afead6e28a841a32d64b39dab46
)
md5sums=(
  8eab33a4edea1ec0b87427fd51e85a58
  b385a38f17643159fac43cd65b116bba
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim: set ts=2 sw=2 et:
