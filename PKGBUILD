#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=alatools
pkgver=2017
pkgrel=1
pkgdesc='Tools for the Arch Linux Archive.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/alatools"
depends=(python3)
source=(
  http://xyne.archlinux.ca/projects/alatools/src/alatools-2017.tar.xz
  http://xyne.archlinux.ca/projects/alatools/src/alatools-2017.tar.xz.sig
)
sha512sums=(
  beb6338f4f0e1139ba91d59e79c7c91ae69545e49af17633574054ce6104033e605e47efe71a0f991116f5010076a33567831a51e87067375f3a922e7af878b6
  e04e1d1bd05a57fdeb9ebfc3a7b105d74ee5858fc30a1cd4201971e0b8d98bec6019d938291eb011264331a8304c78099a860bbd6e08940e9c9e2f2d7eb0c683
)
md5sums=(
  ed6a2971023d3b7acaaae92ac357b2a7
  3c3fa643823eb517d6b8d57d8236d326
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  for script_ in "$srcdir/$pkgname-$pkgver/exe/"*
  do
    install -Dm755 "$script_" "$pkgdir/usr/bin/${script_##*/}"
  done
}


# vim: set ts=2 sw=2 et:
